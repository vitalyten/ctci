#!/usr/bin/ruby




def isUnique(str)
	a = 0
	str.each_codepoint do |c|
		n = c - 97
		if a & (1 << n) > 0
			return false
		else
			a |= (1 << n)
		end
	end
	return true
end
str = gets.strip
if isUnique(str)
	puts "unique"
else
	puts "not unique"
end


