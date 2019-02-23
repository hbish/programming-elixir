defmodule Parallel do
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(
         fn elem ->
           spawn_link fn ->
             # need to pass `me` here because its inside of another pid
             (send me, {self(), fun.(elem)})
           end
         end
       )
    |> Enum.map(
         fn pid -> receive do
           
                     {_pid, result} -> result
                   end
         end
       )
  end

  def times(x) when x > 0 do
    IO.inspect Parallel.pmap 1..100, &(&1 * &1)
    times(x-1)
  end

  def times(_x) do
  end
end

IO.inspect Parallel.times(10)