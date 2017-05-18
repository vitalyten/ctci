#!/usr/bin/ruby

arr = Array.new(10000000 / 32, 0)

File.open("file.txt", "r") do |f|
	f.each_line do |line|
		n = line.to_i
		arr[n / 32] |= (1 << (n % 32))
	end
end

arr.each_index do |i|
	if arr[i] < 0xffffffff
		j = 0
		while ((arr[i] & (1 << j)) > 0)
			j += 1
		end
		p i * 32 + j
	end
end
