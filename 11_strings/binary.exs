b = <<1, 2, 3>>

IO.inspect byte_size b
IO.inspect bit_size b

b = <<1 :: size(2), 1 :: size(3)>>

IO.inspect byte_size b
IO.inspect bit_size b

int = <<1>>

float = <<2.5 :: float>>

IO.inspect <<int :: binary, float :: binary>>


# Converting float to binary and back
IO.inspect <<sign :: size(1), exp :: size(11), mantissa :: size(52)>> = <<3.14159 :: float>>
IO.inspect (1 + mantissa / :math.pow(2, 52)) * :math.pow(2, exp - 1023) * (1 - 2 * sign)