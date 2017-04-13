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

	def delete(val)
		if @head.val == val
			@head = @head.next
			return true
		else
			curr = @head.next
			prev = @head
			while curr
				if curr.val == val
					prev.next = curr.next
					return true
				end
				prev = curr
				curr = curr.next
			end
			return false
		end
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
end


list = LinkedList.new(1)
list.add(1)
list.add(2)
list.add(2)
list.add(3)
list.add(3)
list.add(4)
list.add(5)
list.add(3)
list.add(6)
list.add(7)
list.add(7)
list.add(7)
list.show
list.delete(4)
list.show
