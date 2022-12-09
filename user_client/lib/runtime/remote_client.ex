defmodule UserClient.Runtime.RemoteChat do

  @remote_server :userAgent@foxy
  def connect(username) do
    :rpc.call(@remote_server, User, :create_user, [username])
  end

  def validate_user(username) do
    :rpc.call(@remote_server, User, :validate_user, [username])
  end

  def send(usr, to, msg) do
    :rpc.call(:chat@foxy, Chat, :send_msg,[usr, to, msg])
  end
end
