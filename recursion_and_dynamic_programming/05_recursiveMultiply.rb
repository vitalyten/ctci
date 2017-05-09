#!/usr/bin/ruby

def multiply(a, b)
	s = a < b ? a : b
	l = a < b ? b : a
	return multRec(s, l)
end

def multRec(small, large)
	return 0 if small == 0
	return large if small == 1
	half = small >> 1
	halfProd = multRec(half, large)
	return halfProd + halfProd if small % 2 == 0
	return halfProd + halfProd + large
end

print multiply(5, 9), "\n"
