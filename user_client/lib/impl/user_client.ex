defmodule UserClient.Impl.UserClient do

  use Agent

  @me __MODULE__

  def set_user(:ok, username) do
    {:ok, pid} = Agent.start_link(fn -> username end, name: @me) #registro el Agent con un name para que pueda referenciarlo
  end

  def get_username() do
    Agent.get(@me, fn list -> list end)
  end

  def send(:true, to_usr, msg) do
    UserClient.Runtime.RemoteChat.send(get_username(), to_usr, msg)
  end

  def send_msg(to_usr, msg) do
    UserClient.Runtime.RemoteChat.validate_user(to_usr)
    |> send(to_usr, msg)

  end


end
