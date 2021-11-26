defmodule TextClientTest do
  use ExUnit.Case
  doctest TextClient

  test "greets the world" do
    assert TextClient.hello() == :world
  end
end
