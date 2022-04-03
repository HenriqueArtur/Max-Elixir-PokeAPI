defmodule Get do
  defmacro mget resource do
    quote do
      def get(id_or_name) do
        with {:ok, resouce_map} <- get(id_or_name, :no_struct) do
          decode(resouce_map)
        else
          {:error, message} -> {:error, message}
        end
      end

      def get(id_or_name, :no_struct) do
        with {:ok, url} <- generate_url(id_or_name),
            {:ok, body} <- Client.get(url) do
          resouce_map = Poison.decode!(body)
          {:ok, resouce_map}
        else
          {:error, message} -> {:error, message}
        end
      end

      defp generate_url(id_or_name) when is_bitstring(id_or_name), do: {:ok, unquote(resource) <> URI.encode(id_or_name)}
      defp generate_url(id_or_name) when is_integer(id_or_name), do: {:ok, unquote(resource) <> to_string(id_or_name)}
      defp generate_url(id_or_name), do: {:error, "Wrong entry '#{id_or_name}'"}
    end
  end
end
