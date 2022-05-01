defmodule Http.Wrapper do
  @http_adapter Application.get_env(:max_elixir_poke_api, :http_adapter)

  def get(url), do: get_url(url)

  defp get_url(url), do: @http_adapter.get(url)
end
