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

class MyQueue

	def initialize
		@first = Stack.new
		@last = Stack.new
	end
	
	def add(val)
		@first.push(val)	
	end

	def moveToLast
		while @first.isEmpty == false
			@last.push(@first.pop)
		end
	end

	def remove
		moveToLast if @last.isEmpty
		return @last.pop
	end

	def peek
		moveToLast if @last.isEmpty
		return @last.peek
	end

	def isEmpty
		return @first.isEmpty && @second.isEmpty
	end
end


que = MyQueue.new
que.add(1)
puts que.remove
que.add(2)
que.add(3)
que.add(4)
que.add(5)
que.add(6)
que.add(7)
que.add(8)
puts que.remove
