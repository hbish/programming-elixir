st = Stream.map [1, 3, 5, 7], &(&1 + 1)

IO.inspect st
IO.inspect Enum.to_list st

squares = Stream.map st, &(&1 * &1)

IO.inspect squares
IO.inspect Enum.to_list squares


IO.inspect [1, 3, 5, 7]
           |> Stream.map(&(&1 + 1))
           |> Stream.map(&(&1 * &1))
           |> Enum.to_list

##############
# Map vs Stream
##############

IO.inspect Enum.map(1..10_000_000, &(&1 + &1))
           |> Enum.take(5)

IO.inspect Stream.map(1..10_000_000, &(&1 + &1))
           |> Enum.take(5)

# Stream.cycle
Stream.cycle(~w{ green white })
|> Stream.zip(1..5)
|> Enum.map(fn {class, n} -> "<tr class='#{class}}'><td>#{n}</td></tr>\n" end)
|> IO.puts

# Stream.repeatedly
IO.inspect Stream.repeatedly(fn -> true end)
           |> Enum.take(3)

IO.inspect Stream.repeatedly(&:random.uniform/0)
           |> Enum.take(3)

# Stream.iterate
IO.inspect Stream.iterate(0, &(&1 + 1))
           |> Enum.take(5)

IO.inspect Stream.iterate(2, &(&1 + &1))
           |> Enum.take(5)

IO.inspect Stream.iterate([], &[0 | &1])
           |> Enum.take(5)

# Stream.unfold
# fn state -> { stream_value, new_state } end

IO.inspect Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end)
           |> Enum.take(15)

# Stream.resource
defmodule Countdown do
  def sleep(seconds) do
    receive do
    after seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->
        {_h, _m, s} = :erlang.time
        60 - s - 1
      end,
      fn
        0 -> {:halt, 0}
        count -> sleep(1)
                 {[inspect(count)], count - 1}
      end,
      fn _ -> nil end
    )
  end
end

counter = Countdown.timer

printer = counter
          |> Stream.each(&IO.puts/1)

speaker = printer
          |> Stream.each(&Countdown.say/1)

#speaker
#|> Enum.take(5)

# Collectable
IO.inspect Enum.into 1..5, []
IO.inspect Enum.into 1..5, [100, 101]

# Copy from input stream to output
# Enum.into IO.stream(:stdio, :line), IO.stream(:stdio, :line)

# Comprehensions
# Given one or more collections, extract all combination of values from each, optionally filter the values and generate a new collection
IO.inspect for x <- [1, 2], y <- [5, 6], do: x * y
IO.inspect for x <- [1, 2], y <- [5, 6], do: {x, y}

min_maxes = [{1, 4}, {2, 3}, {10, 15}]
IO.inspect for {min, max} <- min_maxes, n <- min..max, do: n

# A filter is predicate, if a condition id false, the the comprehension moves on
first8 = [1, 2, 3, 4, 5, 6, 7, 8]
IO.inspect for x <- first8, y <- first8, x >= y, rem(x * y, 10) == 0, do: {x, y}

reports = [dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy]
IO.inspect for {city, weather} <- reports, do: {weather, city}

IO.inspect for <<ch <- "hello">>, do: ch
IO.inspect for <<ch <- "hello">>, do: <<ch>>

IO.inspect for <<
  <<b1 :: size(2), b2 :: size(3), b3 :: size(3)>> <- "hello"
>>, do: "0#{b1}#{b2}#{b3}"

# into syntax
for x <- ~w{cat dog}, into: %{}, do: {x, String.upcase(x)}
for x <- ~w{cat dog}, into: Map.new, do: {x, String.upcase(x)}
for x <- ~w{cat dog},
    into: %{
      "ant" => "ANT"
    },
    do: {x, String.upcase(x)}

