#!/usr/bin/ruby

def merge(a, b, lastA, lastB)
	i = lastA + lastB + 1
	while lastB >= 0
		if a[lastA] < b[lastB]
			a[i] = b[lastB]
			lastB -= 1
		else
			a[i] = a[lastA]
			lastA -= 1
		end
		i -= 1
	end
end

t = Array.new(15)
a = Array.new(20)
b = Array.new(5)
15.times { |i| t[i] = rand(50) }
5.times { |i| b[i] = rand(50) }
print t.sort!, "\n"
print b.sort!, "\n"
15.times { |i| a[i] = t[i] }
print a, "\n"
merge(a, b, 14, 4)
print a, "\n"

