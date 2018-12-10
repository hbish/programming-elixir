set1 = 1..5 |> Enum.into(MapSet.new)
IO.inspect set1

set2 = 3..8 |> Enum.into(MapSet.new)
IO.inspect set2

IO.inspect MapSet.member? set1, 3

IO.inspect MapSet.union set1, set2

IO.inspect MapSet.difference set1, set2

IO.inspect MapSet.difference set2, set1

IO.inspect MapSet.intersection set1, set2
