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

	def sortStack
		s2 = Stack.new
		while !isEmpty
			el = pop
			while !s2.isEmpty && s2.peek > el
				push(s2.pop)
			end
			s2.push(el)
		end
		while !s2.isEmpty
			push(s2.pop)
		end
	end
end

s1 = Stack.new

s1.push(23)
s1.push(2)
s1.push(13)
s1.push(29)
s1.push(7)
s1.push(93)
s1.push(43)
s1.show
s1.sortStack
s1.show
