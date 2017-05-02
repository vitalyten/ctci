#!/usr/bin/ruby

def rotMatrix(mt)
	len = mt.length
	for layer in 0..len / 2 - 1
		first = layer
		last = len - 1 - layer
		for i in first..last - 1
			offset = i - first

			top = mt[first][i]

			mt[first][i] = mt[last - offset][first]

			mt[last - offset][first] = mt[last][last - offset]

			mt[last][last - offset] = mt[i][last]

			mt[i][last] = top
		end
	end
	mt.each {|a| print a, "\n"}
end

arr = [[1,2,3,4,5],
	   [2,3,4,5,6],
	   [3,4,5,6,7],
	   [4,5,6,7,8],
	   [5,6,7,8,9]]
arr.each {|a| print a , "\n"}
puts
rotMatrix(arr)
