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

	def sumList(list)
		l1 = @head
		l2 = list.head
		if l2
			val = l1.val + l2.val
			l1 = l1.next
			l2 = l2.next
			ret = LinkedList.new(val % 10)
			carry = (val > 9) ? 1 : 0
			val = 0
			while (l1 || l2 || carry != 0)
				if l1
					val += l1.val
					l1 = l1.next
				end
				if l2
					val += l2.val
					l2 = l2.next
				end
				val += carry
				carry = (val > 9) ? 1 : 0
				ret.add(val % 10)
				val = 0
			end
			return ret
		end
	end

	def sumListV2(list)
		l1 = @head
		n1 = 0
		while l1
			n1 *= 10
			n1 += l1.val
			l1 = l1.next
		end
		l2 = list.head
		n2 = 0
		while l2
			n2 *= 10
			n2 += l2.val
			l2 = l2.next
		end
		n3 = (n1 + n2).to_s
		ret = LinkedList.new(n3[0].to_i)
		for i in 1..n3.length - 1
			ret.add(n3[i].to_i)
		end
		return ret
	end
end


l1 = LinkedList.new(6)
l1.add(1)
l1.add(7)
l2 = LinkedList.new(2)
l2.add(9)
l2.add(5)
l1.show
l2.show
l3 = l1.sumListV2(l2)
l3.show
