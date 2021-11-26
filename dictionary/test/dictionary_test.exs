defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "greets the world" do
    assert Dictionary.hello() == :world
  end
end
