defmodule B2Web.Live.Game.WordSoFar do

  use B2Web, :live_component

  def mount(socket) do
    { :ok, socket }
  end

  def render(assigns) do
    ~L"""
    In igure
    """
  end
end
