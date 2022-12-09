defmodule UserClient do

  # alias UserClient.Impl.UserClient
  # alias UserClient.Runtime.RemoteChat

  def start(username) do
    #IO.inspect type
    #IO.inspect args
    spawn_link(__MODULE__, :run, [])
    |> Process.register(String.to_atom(username))

    UserClient.Runtime.RemoteChat.connect(username)
    |> UserClient.Impl.UserClient.set_user(username)

  end

  def get_username() do
    UserClient.Impl.UserClient.get_username()
  end

  defdelegate send_msg(to_user, msg), to: UserClient.Impl.UserClient

  def run do
    receive do
      {:recive_msg, from, msg} ->
        IO.puts "#{from} ==> #{msg} "
    end
    run()
  end

end
