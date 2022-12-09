defmodule User do

  alias User.Runtime.Server

  @opaque t :: Server.t

  @spec get_users() :: String.t
  defdelegate get_users(), to: Server

  defdelegate create_user(user), to: Server
  defdelegate validate_user(user), to: Server
end
