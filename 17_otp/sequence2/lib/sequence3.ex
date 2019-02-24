defmodule Sequence3 do
  @server Sequence3.Server
  @moduledoc """
  Documentation for Sequence3.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sequence3.hello()
      :world

  """
  def start_link(current_number) do
    GenServer.start_link(@server, current_number, name: @server)
  end

  def next_number do
    GenServer.call @server, :next_number
  end

  def increment_number(delta) do
    GenServer.cast @server, {:increment_number, delta}
  end
end
