defmodule Capitalize do
  def capitalize_sentences(strings) do

    strings
    |> String.split(". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
    |> IO.puts
  end
end

Capitalize.capitalize_sentences("oh. a DOG. woof.")