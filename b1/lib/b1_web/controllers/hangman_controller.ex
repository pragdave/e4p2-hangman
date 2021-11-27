defmodule B1Web.HangmanController do
  use B1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    put_session(conn, :game, game)
    render(conn, "game.html", tally: tally)
  end
end
