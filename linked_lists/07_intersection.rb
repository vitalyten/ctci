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

	def intersection(list)
		set = Set.new
		node = @head
		while node
			set << node
			node = node.next
		end
		node = list.head
		while node
			return node if set.include?(node)
			node = node.next
		end
		return nil
	end
end


l1 = LinkedList.new("a")
l1.add("b")
l1.add("c")
l1.add("b")
l1.add("e")
l1.show
n1 = l1.head
while n1.next
	n1 = n1.next
end

l2 = LinkedList.new("b")
l2.add("c")
l2.add("d")
n2 = l2.head
while n2.next
	n2 = n2.next
end
#n2.next = n1
l2.show
node = l1.intersection(l2)
if node
	puts node.val
else
	puts "no intersection"
end
