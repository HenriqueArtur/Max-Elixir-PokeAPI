defmodule Http.WrapperTest do
  use ExUnit.Case, async: true

  alias Http.{Wrapper, Mock}

  import Mox

  setup :verify_on_exit!

  test "should pass a proper arguments" do
    url = "url"

    expect(Mock, :get, fn ^url ->
      {:ok, %HTTPoison.Response{status_code: 200, body: ""}}
    end)

    Wrapper.get(url)
  end
end
