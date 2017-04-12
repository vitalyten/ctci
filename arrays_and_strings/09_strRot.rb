#!/usr/bin/ruby

def strRot(s1, s2)
	if s1.length == s2.length
		s1 += s1
		return s1.include? s2
	end
	return false
end

s1 = gets.strip
s2 = gets.strip
if strRot(s1, s2)
	puts "is rotation"
else
	puts "not a rotation"
end

