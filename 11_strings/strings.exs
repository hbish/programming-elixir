name = "ben"

IO.puts "Hello, #{String.capitalize name}"

IO.write "
  This is a
  string that
  spans multiple
  lines
"

IO.write """
  This is a here
  docs string
  that spans
  multiple lines
  """


# character list with no escaping or interpolation
IO.puts ~C[1\n2#{1+2}]

# character list, escaped and interpolated
IO.puts ~c[1\n2#{1+2}]

# String with no escaping or interpolation
IO.puts ~S[1\n2#{1+2}]

# string with escaping and interpolation
IO.puts ~s[1\n2#{1+2}]

# whitespace delimited words / no escaping and interpolation
IO.puts ~W[the c#{'a'}t sat on the map]

# whitespace delimited words w/ interpolation
IO.puts ~w[the c#{'a'}t sat on the map]

# Date
IO.puts ~D[1999-12-12]

# Time
IO.puts ~T[21:23:33]

# single quoted strings are integer character codes
str = 'hello'
IO.inspect str
IO.inspect [head | tail] = str
IO.inspect head
IO.inspect tail

# double quoted strings are 'strings'
str = "hello"
IO.inspect str