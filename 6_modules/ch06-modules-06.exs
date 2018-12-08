# Im thinking of a number between 1 and 1000

# The most efficient way to find the number is to guess halfway
# between the low and high numbers of the range. If our guess is too
# big, them the answer lies between the bottom of the range and one less
# than our guess. If or guess is too small, then the answer lies between
# one more than our guess and the end of the range.

# Build API guess(actual. range), where range is Elixir range.
# Your output should look similar to this:
# iex> Chop.guess(273, 1..1000)
# Is it 500
# Is it 250
# Is it 375
# Is it 312
# Is it 281
# Is it 265
# Is it 273
# 273

defmodule Chop do
  def guess(n, _, n) do
    IO.puts n
  end

  def guess(n, low.._, guess) when guess > n do
    guess(n, low..guess - 1)
  end

  def guess(n, _..high, guess) when guess < n do
    guess(n, guess + 1..high)
  end

  def guess(n, low..high) do
    mid = div(low + high, 2)
    IO.puts "Is it #{mid}"
    guess(n, low..high, mid)
  end
end

Chop.guess(273, 1..1000)