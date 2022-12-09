defmodule Chat.Runtime.Server do

  use GenServer

  ### client process
  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  ### server process

  def init(args) do #luego del start_link se ejecuta el init, tiene que devolver el state inicial
    IO.puts "BBB"
    IO.inspect args

    {:ok, Chat.Impl.Chat.new_chat(args) }
  end

  # def handle_call({:send, msg}, _from, game) do #el game es el state
  #   #IO.inspect game
  #   #{ updated_game, tally } = Game.make_move(game, guess)
  #   #{ :reply, tally, updated_game }
  # end

  # def handle_call({:get_msg }, _from, game) do
  #   #{ :reply, Game.tally(game), game }
  # end

end
