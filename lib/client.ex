defmodule Client do
  alias Constant.URL, as: URL
  @base URL.get()

  def get(url) do
    case HTTPoison.get(@base <> url) do
      { :ok, %HTTPoison.Response{ body: body } } ->
        body
      { :error, %HTTPoison.Error{ reason: reason } } ->
        { :error, reason }
    end
  end
end
