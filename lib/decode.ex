defmodule Decoder do
  @doc "Defines a struct and decode/1 function."
  defmacro mdecode(str_fields, block \\ [do: nil])

  defmacro mdecode(str_fields, [do: _] = block) do
    quote do
      defstruct Enum.map(unquote(str_fields), &String.to_atom/1)

      def decode({k, v}) when k == :error, do: {:error, v}

      def decode(%{} = map) do
        map
          |> Map.take(unquote(str_fields))
          |> Enum.map(fn({k, v}) -> {String.to_existing_atom(k), v} end)
          |> Enum.map(&decode/1)
          |> fn(data) -> struct(__MODULE__, data) end.()
      end

      unquote(block)

      def decode({k, v}) when is_number(v), do: {k, v}
      def decode({k, v}) when is_boolean(v), do: {k, v}
      def decode({k, v}) when is_bitstring(v), do: {k, v}

      def decode({k, v} = data) do
        named_api_struct = Enum.map(v, fn({key, value}) -> {String.to_existing_atom(key), value} end)
          |> fn(data) -> struct(__MODULE__, data) end.()
        { k, named_api_struct }
      end

    end
  end

  @doc "Defines a decode/1 function that does an `Enum.map` with a function or module."
  defmacro mlist(field, args) do
    quote do
      cond do
        is_atom(unquote(args)) ->
          def decode({unquote(field), arg}) when is_list(arg) do
            {unquote(field), Enum.map(arg, fn(data) -> unquote(args).decode(data) end)}
          end
        is_function(unquote(args)) ->
          def decode({unquote(field), arg}) when is_list(arg) do
            {unquote(field), Enum.map(arg, fn(data) -> unquote(args).(data) end)}
          end
      end
    end
  end

  @doc "Defines a sub-struct and decode/1 function."
  defmacro mstruct(struct_aton, module) do
    quote do
      def decode({k, _v} = data) when (k == unquote(struct_aton)) do
        unquote(module).decode(data)
      end
    end
  end
end
