defmodule Sequence.Server do
  @moduledoc false

  use GenServer

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, current_stack) do
    first = Enum.at(current_stack, 0)
    new_stack = Enum.drop(current_stack, 1)
    {:reply, first, new_stack}
  end

  def handle_cast({:push, value}, current_stack) do
    new_stack = [value] ++ current_stack
    {:noreply, new_stack}
  end
end
