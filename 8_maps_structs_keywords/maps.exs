map = %{name: "Ben", likes: "programming", where: "Sydney"}

IO.puts inspect Map.keys map
IO.puts inspect Map.values map
IO.puts inspect map[:name]
IO.puts inspect map1 = Map.drop map, [:likes]
IO.puts inspect map2 = Map.put map, :also_likes, "Java"
IO.puts inspect Map.has_key? map1, :where
IO.puts inspect Map.has_key? map1, :likes
IO.puts inspect {_value, updated_map}= Map.pop map2, :also_likes
IO.puts inspect Map.equal? map, map2
IO.puts inspect Map.equal? map, updated_map

%{name: a_name} = map
IO.puts a_name

IO.puts inspect %{name: _, where: _} = map

# Updating a map with existing key
new_map = %{map | name: "Benji"}
IO.puts inspect new_map

# Update a map with new key
IO.puts inspect Map.put_new(new_map, :nickname, "Benjamin")