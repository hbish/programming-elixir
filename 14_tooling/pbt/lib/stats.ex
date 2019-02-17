defmodule Stats do
  def sum(vals),
      do: vals
          |> Enum.reduce(0, &(+ / 2))

  def count(vals),
      do: vals
          |> Enum.count

  def average(vals), do: sum(vals) / count(vals)
end