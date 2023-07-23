defmodule MaxElixirPokeApi.HttpClient.HTTPoisonTest do
  use ExUnit.Case, async: true
  use Patch

  test "should status code was 200" do
    patch(HTTPoison, :get, {:ok, %{status_code: 200, body: "{}"}})
    assert {:ok, %{}} == MaxElixirPokeApi.HttpClient.HTTPoison.get("url.com")
  end

  test "should status code was NOT 200" do
    patch(HTTPoison, :get, {:ok, %{status_code: 204, body: "{}"}})
    assert {:error, %{reason: "HTTP Status '204'"}} == MaxElixirPokeApi.HttpClient.HTTPoison.get("url.com")
  end

  test "should error" do
    patch(HTTPoison, :get, {:error, reason: "some error"})
    assert {:error, reason: "some error"} == MaxElixirPokeApi.HttpClient.HTTPoison.get("url.com")
  end
end
