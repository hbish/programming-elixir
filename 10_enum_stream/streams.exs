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

speaker
|> Enum.take(5)