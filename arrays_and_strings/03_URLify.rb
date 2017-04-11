#!/usr/bin/ruby

def urlify(str)
	return str.gsub(" ", "%20")
end

str = gets.strip
puts urlify(str)
