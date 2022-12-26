defmodule MaxElixirPokeApi do
  alias MaxElixirPokeApi.Helper

  def resource(:berry), do: do_request("berry")
  
  defp do_request(resource) do
    resource
    |> Helper.make_url
    |> Helper.client_get
    |> Helper.response
    |> Helper.decode
  end
end
