defmodule Calculator do
  def calculate?(input) do
    expression = Enum.reject(input, &(&1 == ?\s))
    {n1, remaining} = parse_number(expression)
    {op, remaining} = parse_operator(remaining)
    {n2, []} = parse_number(remaining)
    op.(n1, n2)
  end

  defp parse_number(expression), do: _parse_number({0, expression})

  defp _parse_number({value, [digit | remaining]}) when digit in ?0..?9 do
    _parse_number({value * 10 + digit - ?0, remaining})
  end

  defp _parse_number(result), do: result

  defp parse_operator([?+ | remaining]), do: {&(&1 + &2), remaining}
  defp parse_operator([?- | remaining]), do: {&(&1 - &2), remaining}
  defp parse_operator([?* | remaining]), do: {&(&1 * &2), remaining}
  defp parse_operator([?/ | remaining]), do: {&(div(&1, &2)), remaining}
end

defmodule CalculatorV2 do
  def calculate?(input) do
    input
    |> Enum.reject(&(&1 == ?\s))
    |> _parse([], 0)
    |> _calculate
  end

  defp _parse([], stack, value), do: stack ++ [value]
  defp _parse([char | tail], stack, value) when char in '0123456789' do
    # subtract 48 to convert char to ascii number
    _parse(tail, stack, value * 10 + (char  - 48))
  end
  defp _parse([op | tail], stack, value) when op in '-+*/' do
    op_func = case op do
      ?+ -> &+/2
      ?- -> &-/2
      ?* -> &*/2
      ?/ -> &div/2
    end

    _parse(tail, stack ++ [value, op_func], 0)
  end

  defp _calculate([]), do: 0
  defp _calculate([result]), do: result
  defp _calculate([x, op_func, y | tail]) do
    _calculate([op_func.(x, y) | tail])
  end
end



IO.inspect Calculator.calculate?('23+45')
IO.inspect Calculator.calculate?('34 - 56')
IO.inspect Calculator.calculate?('134 - 256')
IO.inspect Calculator.calculate?('6654 - 4356')

IO.inspect CalculatorV2.calculate?('23+45')
IO.inspect CalculatorV2.calculate?('34 - 56')
IO.inspect CalculatorV2.calculate?('134 - 256')
IO.inspect CalculatorV2.calculate?('6654 - 4356')
IO.inspect CalculatorV2.calculate?('123+27-50')
IO.inspect CalculatorV2.calculate?('123 + 27 * 4 / 2 - 1')

