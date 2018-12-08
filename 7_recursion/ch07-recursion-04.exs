# Write a function span(from, to) that returns a list of numbers
# from from to to.

defmodule MyList do
  def span(to, to), do: [to]
  def span(from, to) when from > to, do: raise "error from greater than to"
  def span(from, to), do: [from | span(from + 1, to)]
end

IO.puts inspect MyList.span(1,5)
IO.puts inspect MyList.span(5,1)