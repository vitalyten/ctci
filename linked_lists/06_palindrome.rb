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

	def palindrome?
		node = @head
		s = ""
		len = 0
		while node
			s << node.val
			len += 1
			node = node.next
		end
		l = s.slice(0, len / 2)
		r = s.split(//).last(len / 2).join.reverse
		return true if l == r
		return false
	end
end


l1 = LinkedList.new("a")
l1.add("b")
l1.add("d")
l1.add("b")
l1.add("a")
l1.show
if l1.palindrome?
	puts "palindrome"
else
	puts "not a palindrome"
end
