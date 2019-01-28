defmodule MyList do
  def span(to, to), do: [to]
  def span(from, to) when from > to, do: raise "error from greater than to"
  def span(from, to), do: [from | span(from + 1, to)]

  def primes_in_range(n) do
    range = span(2, n)
    range -- for x <- range, y <- range, x <= y, x * y <= n, do: x * y
  end
end

IO.inspect MyList.primes_in_range(10)
IO.inspect MyList.primes_in_range(40)
IO.inspect MyList.primes_in_range(400)