defmodule Sum do
  def from_1(0), do: 0
  def from_1(n) do
    n + from_1(n - 1)
  end
end

IO.puts Sum.from_1(0)
IO.puts Sum.from_1(2)
IO.puts Sum.from_1(8)
IO.puts Sum.from_1(12)