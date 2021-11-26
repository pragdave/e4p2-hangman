defmodule Dictionary.Runtime.Server do

  @type t :: pid()

  @me __MODULE__

  use Agent

  alias Dictionary.Impl.WordList

  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word() do
    Agent.get(@me, &WordList.random_word/1)
  end
end
