#!/usr/bin/ruby

class Node
	attr_accessor :val, :next

	def initialize(val, next_node)
		@val = val
		@next = next_node
	end
end

class Stack 
	attr_accessor :head, :next, :size 

	def initialize
		@head = nil
		@size = 0
	end

	def push(val)
		@head = Node.new(val, @head)
		@size += 1
	end

	def isEmpty
		return @head == nil
	end

	def pop
		raise "Stack is empty!" if isEmpty
		val = @head.val
		@head = @head.next
		@size -= 1
		return val
	end

	def peek
		raise "Stack is empty!" if isEmpty
		return @head.val
	end

	def show
		curr = @head
		while curr
			print curr.val
			print "->" if curr.next
			curr = curr.next
		end
		puts
	end

end

class SetOfStacks
	attr_accessor :head, :set, :cap, :curr
	
	def initialize(cap)
		@cap = cap
		@curr = 0
		@set = Array.new(1, Stack.new)
	end

	def push(val)
		if @set[@curr].size < @cap
			@set[@curr].push(val)
		else
			newStack = Stack.new
			newStack.push(val)
			@set << newStack
			@curr += 1
		end
	end

	def pop
		val = @set[@curr].pop
		if @set[@curr].size == 0 && @curr > 0
			@set.pop
			@curr -= 1
		end
		return val
	end

	def popAt(i)
		raise "No such stack!" if i > @curr || i < 0
		val = @set[i].pop
		if @set[i].size == 0 && @curr > 0
			@set.delete_at(i)
			@curr -= 1
		end
		return val
	end

	def show
		@set.each {|stack| stack.show}
		puts
	end
end

stacks = SetOfStacks.new(2)
stacks.push(1)
stacks.push(2)
stacks.push(3)
stacks.push(4)
stacks.push(5)
stacks.push(6)
stacks.push(7)
stacks.push(8)
stacks.show
puts stacks.pop
stacks.show
puts stacks.pop
stacks.show
puts stacks.popAt(1)
stacks.show
puts stacks.popAt(1)
stacks.show
puts stacks.pop
stacks.show
puts stacks.pop
stacks.show
puts stacks.pop
stacks.show
puts stacks.pop
stacks.show

