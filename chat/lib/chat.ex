defmodule Chat do
  @moduledoc """
  Chat keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def new_chat(usr, to_usr) do
    {:ok, pid } = Chat.Runtime.Application.start_chat(usr, to_usr)
    pid
  end

  def send_msg(usr, to_usr, msg) do
    Chat.Impl.Chat.send_msg(usr,to_usr, msg)
  end

end
