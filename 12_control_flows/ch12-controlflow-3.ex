defmodule ExceptionTest do
  def ok!({:ok, data}), do: data
  def ok!({_, _}), do: raise "wrong type"
end

ExceptionTest.ok!(File.open("./fizzbuzz.exs"))
ExceptionTest.ok!({:wtf, "ghe"})