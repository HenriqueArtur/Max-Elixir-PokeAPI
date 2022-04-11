defmodule Client do
  alias Constant.URL, as: URL
  require Jason

  @callback get(url :: String.t) :: {:ok, %{}}
  @callback get(url :: String.t) :: {:error, %{}}

  @callback response({:ok, %{status_code: integer(), body: %{}}}) :: {:ok, body :: %{}}
  @callback response({:ok, %{status_code: integer()}}) :: {:ok, %{reason: String.t}}
  @callback response({:error, %{reason: String.t}}) :: {:ok, %{reason: String.t}}

  @callback decode({:ok, %{}}) :: {:ok, %{}}
  @callback decode({:error, %{reason: String.t}}) :: {:error, %{reason: String.t}}

  @base URL.get()

  def get(url) do
    @base <> url
      |>http_client().get()
      |>response()
      |>decode()
  end

  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}

  defp response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}

  defp response({:error, %{reason: reason}}), do: {:error, %{reason: reason}}

  defp decode({:ok, body}) do
    map = Jason.decode!(body)
    {:ok, map}
  end

  defp decode({:error, _reason} = response) do
    response
  end

  defp http_client do
    Application.get_env(:max_elixir_poke_api, :http_client)
  end
end
