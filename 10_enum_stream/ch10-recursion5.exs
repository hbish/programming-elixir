defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end

  def each([], _), do: :ok
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], _), do: []
  def filter([head | tail], fun) do
    if fun.(head) do
      filter(tail, fun)
    else
      [head | filter(tail, fun)]
    end
  end

  def split(list, 0), do: {[], list}
  def split(list, n) when n > 0 do
    _split(list, n, [])
  end
  def split(list, n) when n < 0 do
    _split(list, n + length(list), [])
  end
  defp _split([head | tail], n, result) when length(result) < n do
    _split(tail, n, result ++ [head])
  end
  defp _split(list, _n, result) do
    {result, list}
  end

  def take(list, 0), do: []
  def take(list, n) when n > 0 do
    _take(list, n, [])
  end
  def take(list, n) when n < 0 do
    count = abs(n)
    _take(reverse(list), count, [])
    |> reverse
  end
  defp _take(list, n, _) when length(list) < n, do: list
  defp _take(_list, n, result) when length(result) == n, do: result
  defp _take([head | tail], n, result) when length(result) < n do
    _take(tail, n, result ++ [head])
  end

  def reverse(list), do: reverse(list, [])
  def reverse([], reversed), do: reversed
  def reverse([head | tail], reversed) do
    reverse(tail, [head | reversed])
  end

end

IO.inspect MyEnum.all? [], &(&1 < 3)
IO.inspect MyEnum.all? [1, 2, 3, 4, 5, 6], &(&1 < 3)
IO.inspect MyEnum.all? [1, 2, 3, 4, 5, 6], &(&1 < 10)

IO.inspect MyEnum.each [], &(IO.puts &1 + 10)
IO.inspect MyEnum.each [1, 2, 3, 4, 5, 6], &(IO.puts &1 + 10)

IO.inspect MyEnum.filter [], &(&1 < 3)
IO.inspect MyEnum.filter [1, 2, 3, 4, 5, 6], &(&1 < 3)

IO.inspect MyEnum.split([1, 2, 3, 4], 2)  # {[1,2], [3,4]}
IO.inspect MyEnum.split([1, 2, 3, 4], 10) # {[1,2,3,4], []}
IO.inspect MyEnum.split([1, 2, 3, 4], 0)  # {[], [1,2,3,4]}
IO.inspect MyEnum.split([1, 2, 3, 4], -1) # {[1,2,3], [4]}
IO.inspect MyEnum.split([1, 2, 3, 4], -5) # {[], [1,2,3,4]}

IO.inspect MyEnum.take([1, 2, 3, 4], 2)  # [1,2]
IO.inspect MyEnum.take([1, 2, 3, 4], 10) # [1,2,3,4]
IO.inspect MyEnum.take([1, 2, 3, 4], 0)  # []
IO.inspect MyEnum.take([1, 2, 3, 4], -1) # [4]
IO.inspect MyEnum.take([1, 2, 3, 4], -5) # [1,2,3,4]