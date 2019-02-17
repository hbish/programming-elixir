defmodule SpawnName do
  def greet do
    receive do
      {sender, msg} -> send sender, {:ok, "Hello, #{msg}"}
                       greet()
    end
  end
end

pid1 = spawn(SpawnName, :greet, [])
pid2 = spawn(SpawnName, :greet, [])

send pid2, {self(), "Betty!"}
send pid1, {self(), "Fred!"}

receive do
  {:ok, message} -> IO.puts message
end

receive do
  {:ok, message} -> IO.puts message
end