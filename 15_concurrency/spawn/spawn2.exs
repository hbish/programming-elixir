defmodule Spawn2 do
  @moduledoc false
  def greet do
    receive do
      {sender, msg} -> send sender, {:ok, "Hello, #{msg}"}
    end
  end
end

pid = spawn(Spawn2, :greet, [])

# first message
send pid, {self(), "World!"}

receive do
  {:ok, message} -> IO.puts message
end

# second message
send pid, {self(), "Kermit!"}

receive do
  {:ok, message} -> IO.puts message
end

