#!/usr/bin/ruby




def isUnique(str)
	ht = Hash.new
	str.each_char do |c|
		if ht[c]
			return false
		else
			ht[c] = true
		end
	end
end
str = gets.strip
if isUnique(str)
	puts "unique"
else
	puts "not unique"
end


