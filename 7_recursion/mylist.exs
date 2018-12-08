defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]
  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end

IO.puts MyList.len([])
IO.puts MyList.len([11, 12, 13, 14, 15])
IO.puts inspect MyList.square([])
IO.puts inspect MyList.square([4, 5, 6])
IO.puts inspect MyList.add_1([])
IO.puts inspect MyList.add_1([1000])
IO.puts inspect MyList.add_1([1, 2, 4])
IO.puts inspect MyList.map([], [])
IO.puts inspect MyList.map([1, 2, 3, 4], fn (n) -> n * n end)
IO.puts inspect MyList.map([1, 2, 3, 4], fn (n) -> n + 1 end)
IO.puts inspect MyList.reduce([1, 2, 3, 4, 5], 0, &(&1 + &2))
IO.puts inspect MyList.reduce([1, 2, 3, 4, 5], 1, &(&1 * &2))