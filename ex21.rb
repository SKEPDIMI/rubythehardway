# The classic :,)

def add (a, b)
  return a + b
end
def sub (a, b)
  return a - b
end
def mul (a, b)
  return a * b
end
def div (a, b)
  return a / b
end

puts "30 + 30 = #{add(30, 30)}"
puts "60 - 25 = #{sub(60, 25)}"
puts "2 * 10 = #{mul(2, 10)}"
puts "9 / 3 = #{div(9, 3)}"
puts "(3.1415 * (35 + 46) / (6.7 * (18 - 7))) = #{mul(3.1415, div(add(35, 46), mul(6.7, sub(18, 7))))}"
