defmodule FileReader do
  def read(filename) do
    File.stream!(filename, [:read])
    |> map_rows

  end

  defp map_rows(stream) do
    stream
    |> Enum.drop(1)
    |> Enum.map(&(String.trim / 1))
    |> Enum.map(&(String.split(&1, ",")))
    |> Enum.map(&(convert_to_list / 1))
    |> Enum.map(&(Enum.zip(read_headers(stream), &1)))
  end

  defp read_headers(stream) do
    stream
    |> Enum.take(1)
    |> Enum.map(&String.trim/1)
    |> List.first
    |> String.split(",")
    |> Enum.map(&String.to_atom/1)
  end

  defp convert_to_list([id, state, net_amount]) do
    [
      id,
      String.to_atom(String.replace(state, ":", "")),
      String.to_float(net_amount)
    ]
  end
end

# From ch10-recursion8
defmodule TaxCalc do

  def orders_with_total(orders, tax_rates) do
    Enum.map(orders, &(add_total_to(&1, tax_rates)))
  end

  def add_total_to(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    total = net * (1 + tax_rate)
    Keyword.put(order, :total_amount, total)
  end

end

tax_rates = [NC: 0.075, TX: 0.08]
sales = FileReader.read("./sales.csv");

IO.inspect TaxCalc.orders_with_total(sales, tax_rates)