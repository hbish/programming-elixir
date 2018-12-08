defmodule Gcd do
  def of(x, 0), do: x
  def of(x, y) do
    of(y, rem(x, y))
  end
end

IO.puts Gcd.of(4, 0)
IO.puts Gcd.of(8, 3)
IO.puts Gcd.of(16, 4)
