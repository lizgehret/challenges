#iterative method for the Fibonacci sequence
def fibonacci(n)
  a = 0
  b = 1

  for x in b+1..n do
   a,b = b,a+b
  end
  puts b
end

puts fibonacci(35)

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("fibonacci") { fibonacci(num) }
end