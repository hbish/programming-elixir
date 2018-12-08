# Write a casar(list, n) function that adds n to each list element
# wrapping if the addition results in a character greater than z

defmodule MyList do
  def caesar([], _), do: []
  def caesar([head | tail], n) do
    [97 + rem(head + n - 97, 26), caesar(tail, n)]
  end
end

IO.puts MyList.caesar('ryvkve', 13)