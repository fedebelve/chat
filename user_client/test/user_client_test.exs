defmodule UserClientTest do
  use ExUnit.Case
  doctest UserClient

  test "greets the world" do
    assert UserClient.hello() == :world
  end
end
