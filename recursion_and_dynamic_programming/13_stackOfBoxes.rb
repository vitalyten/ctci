#!/usr/bin/ruby

class Box
	attr_accessor :width, :height, :depth

	def initialize(w, h, d)
		@width = w
		@height = h
		@depth = d
	end

	def canStackOn(b)
		return (@width < b.width and @height < b.height and @depth < b.depth)
	end
end

def getMaxHeight(boxes, heights, bottom)
	return heights[bottom] if bottom < boxes.length and heights[bottom] > 0
	maxH = 0
	i = bottom + 1
	while i < boxes.length
		if boxes[i].canStackOn(boxes[bottom])
			h = getMaxHeight(boxes, heights, i)
			maxH = [maxH, h].max
		end
		i += 1
	end
	heights[bottom] = maxH + boxes[bottom].height
	return heights[bottom]
end

def maxHeight(boxes)
	maxH = 0
	heights = Array.new(boxes.length, 0)
	for i in 0...boxes.length
		h = getMaxHeight(boxes, heights, i)
		maxH = [maxH, h].max
	end
	return maxH
end

boxes = Array.new(10)

for i in 0..9
	boxes[i] = Box.new(rand(10), rand(10), rand(10))
	# boxes[i] = Box.new(i, i, i)
end

boxes.sort! { |a, b| b.height <=> a.height }
print boxes, "\n"

p maxHeight(boxes)

