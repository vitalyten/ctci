#!/usr/bin/ruby

def palPerm(str)
	arr = Array.new(256, 0)
	odd = 0
	str.downcase!
	str.gsub!(" ", "")
	str.each_codepoint {|c| arr[c] += 1}
	arr.each {|x| odd += 1 if x % 2 != 0}
	return true if str.length % 2 == odd
	return false
end

str = gets.strip
if palPerm(str)
	puts("palindrom permutation")
else
	puts("not a palindrome permutation")
end
