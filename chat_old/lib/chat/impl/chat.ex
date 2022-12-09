defmodule Chat.Impl.Chat do

  defstruct( #para predefinir una lista de keys y prevenir que cambie en runtime. Siempre están asociadas a un módulo
            #This is a pretty big clue: structures are meant to hold the data that is processed by that module's functions.
    id: nil,
    state: :initializing,
    chat: []
  )

  @remote_server :userAlgo@foxy

  def new_chat([usr,to_usr]) do
    sorted = Enum.sort([usr,to_usr])
    id = Enum.join(sorted, "")
    {:ok, _pid} = Agent.start_link(fn -> %__MODULE__{id: id} end, name: String.to_atom(id))

    #Agent.update(:users, fn list -> [sorted | list] end)
  end

  def send_msg(usr, to_usr, msg) do
    sorted = Enum.sort([usr,to_usr])
    id = Enum.join(sorted, "")
    #IO.puts(String.to_atom(to_usr<>"@foxy"))
    :rpc.call(:userAlgo@foxy, UserClient, :recive_msg, [to_usr, msg])
    Agent.update(String.to_atom(id), fn estructura -> %__MODULE__{chat: [msg | estructura.chat]} end)
  end

end
