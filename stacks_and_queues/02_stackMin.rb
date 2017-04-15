#!/usr/bin/ruby

class Node
	attr_accessor :val, :next, :min

	def initialize(val, next_node)
		@val = val
		@next = next_node
		if @next != nil
			@min = val < @next.min ? val : @next.min
		else
			@min = val
		end
	end
end

class Stack 
	attr_accessor :head

	def initialize
		@head = nil 
	end

	def min
		raise "Stack is empty!" if isEmpty
		return @head.min
	end

	def push(val)
		@head = Node.new(val, @head)
	end

	def isEmpty
		return @head == nil
	end

	def pop
		raise "Stack is empty!" if isEmpty
		val = @head.val
		@head = @head.next
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

stack = Stack.new
stack.push(2)
puts "min ", stack.min
stack.push(3)
puts "min ", stack.min
stack.push(4)
puts "min ", stack.min
stack.push(5)
puts "min ",stack.min
stack.push(1)
puts "min ",stack.min
stack.show
stack.pop
puts "min ",stack.min
stack.pop
puts "min ",stack.min
stack.pop
stack.pop
stack.pop
