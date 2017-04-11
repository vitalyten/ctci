#!/usr/bin/ruby

def checkPerm(str1, str2)
	arr = Array.new(256, 0)
	str1.each_codepoint {|c| arr[c] += 1}
	str2.each_codepoint {|c| arr[c] -= 1}
	arr.each {|x| return false if x != 0}
	return true
end
s1 = gets.strip
s2 = gets.strip
if checkPerm(s1, s2)
	puts("permutation")
else
	puts("not permutation")
end
