defmodule Spawn3 do
  @moduledoc false

  @doc """
    The recursive call to greet() is not on the stack. In elixir
    it implements tail-call-optimization. I.e if the last thing it does is to
    call itself then it jumps back to the start of the function.
  """
  def greet do
    receive do
      {sender, msg} -> send sender, {:ok, "Hello, #{msg}"}
                       # recurse to receive another message
                       greet()
    end
  end
end

pid = spawn(Spawn3, :greet, [])

# first.txt message
send pid, {self(), "World!"}

receive do
  {:ok, message} -> IO.puts message
end

# second message
send pid, {self(), "Kermit!"}

receive do
  {:ok, message} -> IO.puts message
after 500 -> IO.puts "The greeter is not available"
end

