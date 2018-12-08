# Find library function to do the following

# 1. Convert a float to a string with 2 decimal digits. (Erlang)
IO.puts :io_lib.format('~.2f', [3.1415])

# 2. Get the value of an operating system env var (Elixir)
IO.puts System.monotonic_time()
IO.puts System.get_env("PATH")

# 3. Return the extension of a file name (Elixir)
IO.puts Path.extname('./ch06-modules-07.exs')

# 4. Return the process's current working dir (Elixir)
IO.puts System.cwd

# 5. Execute a command in shell
IO.inspect System.cmd("uptime", [])