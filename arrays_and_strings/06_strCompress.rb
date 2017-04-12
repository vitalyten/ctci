#!/usr/bin/ruby

def strCompress(str)
	comst = ""
	n = 1
	for i in 0..str.length - 1
		if str[i] == str[i + 1]
			n += 1
		else
			comst << "#{n}#{str[i]}"
			n = 1
		end
	end
	return (str.length > comst.length) ? comst : str
end

str = gets.strip
puts strCompress(str)
