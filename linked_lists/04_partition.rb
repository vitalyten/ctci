#!/usr/bin/ruby
require "set"

class Node
	attr_accessor :val, :next

	def initialize(val, next_node)
		@val = val
		@next = next_node
	end
end

class LinkedList
	attr_accessor :head

	def initialize(val)
		@head = Node.new(val, nil)
	end

	def add(val)
		curr = @head
		while curr.next != nil
			curr = curr.next
		end
		curr.next = Node.new(val, nil)
	end

	def show
		curr = @head
		while curr
			print curr.val
			print "->" if curr.next
			curr = curr.next
		end
		print "\n"
	end

	def partition(x)
		node = @head
		tail = @head
		while node
			nxt = node.next
			if node.val < x
				node.next = @head
				@head = node
			else
				tail.next = node
				tail = node
			end
			node = nxt
		end
		tail.next = nil
	end
end


list = LinkedList.new(3)
list.add(5)
list.add(8)
list.add(5)
list.add(10)
list.add(2)
list.add(1)
list.show
list.partition(5)
list.show
