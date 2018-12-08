# write a mapsum function that takes a list and a function.
# apply the function to each element and sum the results

defmodule MyList do
  def mapsum([], _func), do: 0
  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end
end

IO.puts MyList.mapsum([1,2,3], &(&1 * &1))