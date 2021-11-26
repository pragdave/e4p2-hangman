defmodule TextClient do

  @spec start() :: :ok
  defdelegate start, to: TextClient.Impl.Player
end
