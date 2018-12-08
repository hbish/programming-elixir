defmodule Attributes do
  @author "Ben Shi"
  def get_author, do: @author
end

IO.puts "Example written by #{Attributes.get_author}"