#!/usr/bin/ruby

def paintFill(screen, r, c, orig, newc)
	return if r < 0 or c < 0 or r >= screen.length or c >= screen[0].length
	return if screen[r][c] != orig
	screen[r][c] = newc
	paintFill(screen, r + 1, c, orig, newc)
	paintFill(screen, r - 1, c, orig, newc)
	paintFill(screen, r, c + 1, orig, newc)
	paintFill(screen, r, c - 1, orig, newc)
end

screen = [[0,0,0,0,0,0],
		  [0,1,1,1,1,1],
		  [0,1,0,0,0,0],
		  [0,1,0,0,0,0],
		  [0,1,0,0,0,0],
		  [0,1,1,1,1,1],
		  [0,0,0,0,0,0]]

paintFill(screen, 2, 3, screen[2][3], 2)
screen.each { |arr| print arr, "\n" }
