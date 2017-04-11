#!/usr/bin/ruby

def checkPerm(str1, str2)
	if str1.split("").sort == str2.split("").sort
		return true
	else
		return false
	end
end

s1 = gets.strip
s2 = gets.strip
if checkPerm(s1, s2)
	puts("permutation")
else
	puts("not permutation")
end
