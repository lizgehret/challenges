def collatz(input_number)
  length = 1
  if input_number <= 0
    raise ArgumentError.new 'Invalid. Only positive numbers!'
  end

  while input_number != 1
    length += 1
    if input_number.even?
      input_number = input_number / 2
    else
      input_number = (input_number * 3) + 1
    end
  end
  length
end

puts collatz(2)

def max_collatz
  largest_length = 0
  largest_number = 0
  (1..1000000).each do |n|
    length = collatz(n)
    if length > largest_length
      largest_length = length
      largest_number = n
    end
  end
  {:largest_number => largest_number, :largest_length => largest_length}
end

puts max_collatz