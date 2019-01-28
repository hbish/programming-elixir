defmodule StringUtil do
  def is_anagram?(first, second) do
    Enum.sort(first) == Enum.sort(second)
  end
end

IO.inspect StringUtil.is_anagram?('you','til')
IO.inspect StringUtil.is_anagram?('you','uoy')