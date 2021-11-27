defmodule TextClient do

  @spec start() :: :ok
  def start do
    TextClient.Runtime.RemoteHangman.connect()
    |> TextClient.Impl.Player.start()
  end
end
