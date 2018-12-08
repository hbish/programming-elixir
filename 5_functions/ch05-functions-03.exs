# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n) and calls the function
# in the previous exercise, passing it rem(n, 3), rem(n, 5) and n.
# Call it seven times with he arguments 10, 11, 12 and so on.
# You should get Buzz, 11, Fizz, 13, 14, FizzBuzz, 16

fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, n) -> n
end

fb = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts fb.(10)
IO.puts fb.(11)
IO.puts fb.(12)
IO.puts fb.(13)
IO.puts fb.(14)
IO.puts fb.(15)
IO.puts fb.(16)
IO.puts fb.(17)