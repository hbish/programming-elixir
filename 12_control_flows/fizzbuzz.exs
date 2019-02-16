defmodule FizzBuzz do
  def upto(n) when n > 0, do: _upto(1, n, [])
  def upto_v2(n) when n > 0, do: _downto(n, [])
  def upto_v3(n) when n > 0 do
    1..n
    |> Enum.map(&fizzbuzz/1)
  end
  def upto_v4(n) when n > 0 do
    1..n
    |> Enum.map(&fizzbuzz_p/1)
  end
  def upto_v5(n) when n > 0 do
    1..n
    |> Enum.map(&fizzbuzz_case/1)
  end

  # V1
  defp _upto(_current, 0, result), do: Enum.reverse result
  defp _upto(current, left, result)  do
    next_answer = cond do
      rem(current, 3) == 0 and rem(current, 5) == 0 -> "FizzBuzz"
      rem(current, 3) == 0 -> "Fizz"
      rem(current, 5) == 0 -> "Buzz"
      true -> current
    end
    _upto(current + 1, left - 1, [next_answer | result])
  end

  # v2
  def _downto(0, result), do: result
  def _downto(current, result) do
    next_answer = cond do
      rem(current, 3) == 0 and rem(current, 5) == 0 -> "FizzBuzz"
      rem(current, 3) == 0 -> "Fizz"
      rem(current, 5) == 0 -> "Buzz"
      true -> current
    end
    _downto(current - 1, [next_answer | result])
  end

  # V3
  defp fizzbuzz(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      rem(n, 3) == 0 -> "Fizz"
      rem(n, 5) == 0 -> "Buzz"
      true -> n
    end
  end

  # V4
  defp fizzbuzz_p(n) do
    _fizzword(n, rem(n, 3), rem(n, 5))
  end

  defp _fizzword(_n, 0, 0), do: "FizzBuzz"
  defp _fizzword(_n, 0, _), do: "Fizz"
  defp _fizzword(_n, _, 0), do: "Buzz"
  defp _fizzword(n, _, _), do: n

  # V5 - case
  defp fizzbuzz_case(n) do
    case {rem(n, 3), rem(n, 5), n} do
      {0, 0, _} -> "FizzBuzz"
      {0, _, _} -> "Fizz"
      {_, 0, _} -> "Buzz"
      {_, _, n} -> n
    end
  end

end

IO.inspect FizzBuzz.upto(15)
IO.inspect FizzBuzz.upto_v2(15)
IO.inspect FizzBuzz.upto_v3(15)
IO.inspect FizzBuzz.upto_v4(15)
IO.inspect FizzBuzz.upto_v5(15)