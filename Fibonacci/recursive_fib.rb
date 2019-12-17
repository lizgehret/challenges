#recursive method for the Fibonacci sequence
def fibonacci(n)
  return n if n <=1
  fibonacci(n-1) + fibonacci(n-2)
end
puts fibonacci(35)

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("fibonacci") { fibonacci(num) }
end