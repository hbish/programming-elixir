defmodule Fib do
  @moduledoc false

  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: Fib.of(n - 1) + Fib.of(n - 2)
end

IO.puts "Start the task"
worker = Task.async(fn -> Fib.of(20) end)
IO.puts "Do Something Else"
IO.puts "Wait for the task"
result = Task.await(worker)
IO.puts "The result is #{result}"

worker = Task.async(Fib, :of, [30])
result = Task.await(worker)
IO.puts "The result is #{result}"