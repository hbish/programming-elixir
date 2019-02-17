defmodule TailRecursion do
  def factorial(n), do: _fact(n, 1)
  def _fact(0, acc), do: acc
  def _fact(n, acc), do: _fact(n - 1, acc * n)
end

IO.inspect TailRecursion.factorial(5)