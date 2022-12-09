defmodule User.Runtime.Server do

  @type t :: pid()
  alias User.Impl.User

  #@me :fede_agent

  @me __MODULE__

  use Agent

  def start_link(_) do
    {:ok, _pid} = Agent.start_link(&User.start/0, name: @me) #registro el Agent con un name para que pueda referenciarlo
  end

  def get_users() do
    #Agent.get(@me, &User.get_user/1)
    Agent.get(@me, fn content -> content end)
  end

  def create_user(user) do
    Agent.update(@me, fn list -> [user | list] end)
  end

  def validate_user(user) do
    Agent.get(__MODULE__, fn list -> list end)
    |> Enum.member?(user)
  end
end
