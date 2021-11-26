defmodule Dictionary do

  alias Dictionary.Impl.WordList

  @type t :: WordList.t

  @spec start :: t
  defdelegate start, to: WordList, as: :word_list

  @spec random_word(t) :: String.t
  defdelegate random_word(word_list), to: WordList
end

