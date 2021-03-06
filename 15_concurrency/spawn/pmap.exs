defmodule Parallel do
  import :timer, only: [sleep: 1]
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
                     # Order is not enforced when its _
                     {_pid, result} -> result
                   end
         end
       )
  end
end

IO.inspect Parallel.pmap 1..10, &(&1 * &1)