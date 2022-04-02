defmodule Get do
  defmacro mget resource do
    quote do
      def get(id_or_name) do
        id_or_name
          |> get(:no_struct)
          |> decode()
      end

      def get(id_or_name, :no_struct) do
        cond do
          is_bitstring(id_or_name) ->
            unquote(resource) <> URI.encode(id_or_name)
              |> Client.get()
              |> Poison.decode!()
          is_integer(id_or_name) ->
            unquote(resource) <> to_string(id_or_name)
              |> Client.get()
              |> Poison.decode!()
          true ->
            {:error, :wrong_entry}
        end
      end
    end
  end
end
