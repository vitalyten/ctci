#!/usr/bin/ruby

def countWays(n)
	mem = Array.new(n + 1, -1)
	return count(n, mem)
end

def count(n, mem)
	return 1 if n == 0
	return 0 if n < 0
	return mem[n] if mem[n] > -1
	mem[n] = count(n - 1, mem) + count(n - 2, mem) + count(n - 3, mem)
	return mem[n]
end

puts(countWays(7))
