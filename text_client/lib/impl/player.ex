defmodule TextClient.Impl.Player do

  @typep game :: Hangman.game()
  @typep tally :: Hangman.Type.tally()
  @typep state :: {game, tally}

  @spec start :: :ok
  def start() do
    game = Hangman.new_game
    tally = Hangman.tally(game)
    interact({ game, tally })
  end

  @spec interact(state) :: :ok 
  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts("Congratulations. You won!")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts("Sorry, you lost... the word was #{tally.letters |> Enum.join()}")
  end

  def interact({ game, tally }) do
    IO.puts feedback_for(tally)
    IO.puts(current_word(tally))
    Hangman.make_move(game, get_guess())
    |> interact()
  end

  ################################################## 
  
  def feedback_for(tally = %{game_state: :initializing}) do
    "Welcome! I'm thinking of a #{tally.letters |> length} letter word"
  end

  def feedback_for(%{game_state: :good_guess}), do: "Good guess!"
  def feedback_for(%{game_state: :bad_guess}), do: "Sorry, that letter's not in the word"
  def feedback_for(%{game_state: :already_used}), do: "You already used that letter"

  def current_word(tally) do
    [
      "Word so far: ",
      tally.letters |> Enum.join(" "),
      "   turns left: ",
      tally.turns_left |> to_string,
      "   used so far: ",
      tally.used |> Enum.join(",")
    ]
  end

  def get_guess() do
    IO.gets("Next letter: ")
    |> String.trim()
    |> String.downcase()
  end
end
