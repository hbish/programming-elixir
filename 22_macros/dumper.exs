defmodule My do
  defmacro macro(param) do
    IO.inspect param
  end
end

defmodule Test do
  require My
  
  #These values represent themselves
  
  
end