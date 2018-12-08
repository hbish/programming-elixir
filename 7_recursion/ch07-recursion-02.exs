# write a max(list) that returns the element with the max value

defmodule MyList do
  def max([], _func), do: 0
  def max([n]), do: n
  def max([head | tail]) do
    Kernel.max(head, max(tail))
  end
end

IO.puts MyList.max([1, 2, 3])
IO.puts MyList.max([1, 22, 3, 234, 1, 3, 4])