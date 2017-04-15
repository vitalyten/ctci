#!/usr/bin/ruby

class MultiStack
	attr_accessor :size, :nstacks, :stacks, :sizes

	def initialize(n, size)
		@size = size
		@nstacks = n
		@stacks = Array.new(n * size, 0)
		@sizes = Array.new(n, 0)
	end

	def isEmpty(n)
		return @sizes[n] == 0
	end

	def isFull(n)
		return @sizes[n] == @size
	end

	def topIdx(n)
		offset = @size * n
		return @sizes[n] - 1 + offset
	end

	def peek(n)
		return nil if isEmpty(n)
		return @stacks[topIdx(n)]
	end

	def push(n, val)
		if isFull(n)
			raise NoMemoryError.new("Stack is full!")
		end

		@sizes[n] += 1
		@stacks[topIdx(n)] = val
	end

	def pop(n)
		if isEmpty(n)
			raise IndexError.new("Stack is empty!")
		end

		val = @stacks[topIdx(n)]
		@stacks[topIdx(n)] = 0
		@sizes[n] -= 1
		return val
	end

	def show
		for i in 0..@nstacks - 1
			for j in 0..@sizes[i] - 1
				print @stacks[i * @size + j], " "
			end
			puts
		end
	end
end

stacks = MultiStack.new(3, 5)
stacks.push(0, 1)
stacks.push(0, 2)
stacks.push(0, 3)
stacks.push(0, 4)
stacks.push(0, 5)
stacks.push(1, 1)
stacks.push(1, 2)
stacks.push(1, 3)
stacks.push(1, 4)
stacks.push(1, 5)
stacks.push(2, 1)
stacks.push(2, 2)
stacks.push(2, 3)
stacks.push(2, 4)
stacks.push(2, 5)

puts stacks.pop(2)
puts stacks.pop(2)
puts stacks.pop(2)
puts stacks.pop(2)
puts stacks.pop(2)
stacks.show
puts stacks.peek(0)
puts stacks.peek(1)
