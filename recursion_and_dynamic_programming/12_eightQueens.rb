#!/usr/bin/ruby

def checkValid(board, r, c)
	r2 = 0
	while r2 < r
		return false if board[r2] == c
		return false if (r - r2) == (board[r2] - c).abs
		r2 += 1
	end
	return true
end

def setQ(results, board, r)
	if r == 8
		results << board.dup
		return
	end
	for c in 0..7
		if checkValid(board, r, c) == true
			board[r] = c
			setQ(results, board, r + 1)
		end
	end
end





results = Array.new
board = Array.new(8, -1)
setQ(results, board, 0)

def printBoard(board)
	print "  0_1_2_3_4_5_6_7\n"
	for r in 0..7
		print "#{r}|"
		for c in 0..7
			if board[r] == c
				print "Q|"
			else
				print"_|"
			end
		end
		print "\n"
	end
end

for board in results
	printBoard(board)
	print "\n"
end