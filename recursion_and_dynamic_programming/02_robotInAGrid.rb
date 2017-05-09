#!/usr/bin/ruby
require 'set'

def getPath(grid)
	path = Array.new
	return path if findPath(grid, path, grid.length - 1, grid[0].length - 1, Set.new)
	return nil
end

def findPath(grid, path, r, c, deadEnd)
	p = r.to_s + " " + c.to_s
	return false if (r < 0 or c < 0 or grid[r][c] == 0 or deadEnd.include?(p))
	finish = (r == 0 and c == 0) ? true : false
	if (findPath(grid, path, r - 1, c, deadEnd) or
		findPath(grid, path, r, c - 1, deadEnd) or finish)
		path << p
		return true
	end
	deadEnd << p
	return false
end


ar	 = [[1,1,1,1,1],
		[0,1,0,0,1],
		[1,1,1,1,1],
		[1,0,1,0,0],
		[1,1,1,1,1],
		[1,0,1,0,1],
		[1,1,1,1,1]]

path = getPath(ar)
if path != nil
	path.each {|p| print p, "\n"}
end