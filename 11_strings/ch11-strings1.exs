defmodule StringUtil do
  def is_ascii?(input) do
    Enum.all?(input, fn ch -> ch in ?\s..?~ end)
  end
end

IO.inspect StringUtil.is_ascii?('ben')
IO.inspect StringUtil.is_ascii?('˙∑ˆˆˆˆ˚µ√∫¨¨œø∫˜')
