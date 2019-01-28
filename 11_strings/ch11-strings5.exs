defmodule DQS do
  def center(strings) do
    max_length = (for x <- strings, do: String.length(x))
                 |> Enum.max
    strings
    |> Enum.sort(&(String.length(&1) <= String.length(&2)))
    |> center_word(max_length)
  end

  defp center_word([head | tail], max_length) do
    pads = String.duplicate " ", div(max_length - String.length(head), 2)
    IO.puts pads <> head <> pads
    center_word(tail, max_length)
  end
  defp center_word(new_list, _), do: new_list
end

DQS.center(["cat", "zebra", "elephant", "dog", "fish", "crocodile"])