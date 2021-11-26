defmodule Dictionary do

  alias Dictionary.Runtime.Server

  @type t :: Server.t

  @spec start_link :: { :ok, t }
  defdelegate start_link, to: Server

  @spec random_word(t) :: String.t
  defdelegate random_word(word_list), to: Server
end

