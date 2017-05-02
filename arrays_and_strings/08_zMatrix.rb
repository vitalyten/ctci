#!/usr/bin/ruby


def zMatrix(mt)
	h = mt.length
	w = mt[0].length
	tab = Array.new
	for i in 0..h - 1
		for j in 0..w - 1
			tab << [i,j] if mt[i][j] == 0
		end
	end
	tab.each do |a|
		for i in 0..h - 1
			mt[i][a[1]] = 0
		end
		for i in 0..w - 1
			mt[a[0]][i] = 0
		end
	end
	mt.each {|a| print a, "\n"}
end

mt = [[1,2,3,4,5],
	  [2,0,4,5,6],
	  [3,4,5,6,7],
	  [4,5,6,0,8],
	  [5,6,7,8,9]]

mt.each {|a| print a, "\n"}
puts
zMatrix(mt)
