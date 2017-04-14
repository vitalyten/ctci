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

	def loopV2
		set = Set.new
		node = @head
		while node && set.include?(node) == false
			set << node
			node = node.next
		end
		return node
	end

	def loopDetection
		n1 = @head
		n2 = @head
		while n2 && n2.next
			n1 = n1.next
			n2 = n2.next.next
			break if n1 == n2
		end
		return nil if n2 == nil || n2.next == nil
		n1 = @head
		while n1 != n2
			n1 = n1.next
			n2 = n2.next
		end
		return n1
	end
end


l1 = LinkedList.new("a")
l1.add("b")
l1.add("c")
l1.add("d")
l1.add("e")
l1.show
n1 = l1.head
while n1.next
	node = n1 if n1.val == "c"
	n1 = n1.next
end
n1.next = node
node = l1.loopV2
if node
	puts node.val
else
	puts "no loop detected"
end
