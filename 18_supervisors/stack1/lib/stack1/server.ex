defmodule Stack1.Server do
  @moduledoc false

  @name MyStackServer

  use GenServer

  ##############
  # External API
  ##############
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, [name: @name])
  end

  def push(value) do
    GenServer.cast @name, {:push, value}
  end

  def pop do
    GenServer.call @name, :pop
  end

  #############
  # GenServer Implementation
  #############
  def init(_) do
    {:ok, Stack1.Stash.get()}
  end

  def handle_call(:pop, _from, current_stack) when current_stack == [] do
    raise "error popping from empty stack"
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

  def terminate(_reason, current_stack) do
    Stack1.Stash.update(current_stack)
  end
end
