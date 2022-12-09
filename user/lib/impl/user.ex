defmodule User.Impl.User do

  @type t :: list(String)
  @spec start() :: t
  def start() do
    "assets/users.txt"
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def get_user(users) do
    users
    |> Enum.random()

  end

end
