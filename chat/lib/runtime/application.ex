defmodule Chat.Runtime.Application do

  @super_name ChatStarter
  @chats ChatsAgent

  use Application
  use Agent

  def start(_type, _args) do
    #{:ok, _pid} = Agent.start_link(fn -> nil end, name: :users)

    supervisor_spec = [
      { DynamicSupervisor, strategy: :one_for_one, name: @super_name },
    ]
    # agent_supervisor_spec = [
    #   { DynamicSupervisor, strategy: :one_for_one, name: @chats },
    # ]
     Supervisor.start_link(supervisor_spec, strategy: :one_for_one)
    # children = [
    #   nil
    # ]

    # Supervisor.start_link(children, strategy: :one_for_all, name: @chats)
  end

  def start_chat(usr, to_usr) do
    DynamicSupervisor.start_child(@super_name,  { Chat.Runtime.Server, [usr, to_usr] })
  end

end
