defmodule Swapper do
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise "Can't swap single element"
end

IO.inspect Swapper.swap([1, 2, 3, 4])
IO.inspect Swapper.swap([1, 2, 3, 4, 5])