require Integer

# convert collection to list
list = Enum.to_list 1..5
IO.inspect list

# concat
IO.inspect Enum.concat([1, 2, 3], [4, 5, 6])
IO.inspect Enum.concat([1, 2, 3], 'abc')

# apply function for collectio
IO.inspect Enum.map(list, &(&1 * 10))
IO.inspect Enum.map(list, &String.duplicate("*", &1))

# select by position and criteria
IO.inspect Enum.at(10..20, 3)
IO.inspect Enum.at(10..20, 20)
IO.inspect Enum.at(10..20, 20, :not_found)
IO.inspect Enum.filter(list, &(&1 > 2))
IO.inspect Enum.filter(list, &Integer.is_even/1)
IO.inspect Enum.reject(list, &Integer.is_even/1)

# sort and compare
IO.inspect Enum.sort ["I", "once", "was", "a", "Java", "Developer"]
IO.inspect Enum.sort ["I", "once", "was", "a", "Java", "Developer"], &(String.length(&1) >= String.length(&2))
IO.inspect Enum.max ["I", "once", "was", "a", "Java", "Developer"]
IO.inspect Enum.max_by ["I", "once", "was", "a", "Java", "Developer"], &String.length/1

# split
IO.inspect Enum.take(list, 3)
IO.inspect Enum.take_every list, 2
IO.inspect Enum.take_while(list, &(&1 < 4))
IO.inspect Enum.split(list, 3)
IO.inspect Enum.split_while(list, &(&1 < 2))

# join
IO.inspect Enum.join(list)
IO.inspect Enum.join(list, "-")

# Predicate
IO.inspect Enum.all?(list, &(&1 < 4))
IO.inspect Enum.any?(list, &(&1 < 4))
IO.inspect Enum.member?(list, 4)
IO.inspect Enum.empty?(list)

# merge
IO.inspect Enum.zip(list, [:a, :b, :c])
IO.inspect Enum.with_index(list)

# fold/reduce
IO.inspect Enum.reduce(1..100, &(&1 + &2))
IO.inspect Enum.reduce(
             ["now", "its", "the", "time"],
             fn word, longest ->
               if String.length(word) > String.length(longest) do
                 word
               else
                 longest
               end
             end
           )

IO.inspect Enum.reduce(
             ["now", "its", "the", "time"],
             fn word, longest ->
               if String.length(word) > String.length(longest) do
                 String.length(word)
               else
                 longest
               end
             end
           )

# deal a deck of cards
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do:
  [suit, rank]

IO.inspect deck

# shuffle and deal 13 cards
IO.inspect deck |> Enum.shuffle |> Enum.take(13)

# shuffle and deal 13 cards per player
IO.inspect deck |> Enum.shuffle |> Enum.chunk(13)
