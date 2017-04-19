#!/usr/bin/ruby
class ListNode
	attr_accessor :val, :next

	def initialize(val, next_node)
		@val = val
		@next = next_node
	end
end

class List
	attr_accessor :head

	def initialize
		@head = nil 
	end

	def add(val)
		node = ListNode.new(val, nil)
		if @head == nil
			@head = node
		else
			curr = @head
			while curr.next != nil
				curr = curr.next
			end
			curr.next = node 
		end
	end

	def isEmpty
		return @head == nil
	end

	def show
		curr = @head
		while curr
			print curr.val.val
			print "->" if curr.next
			curr = curr.next
		end
		print "\n"
	end
end

class Node
	attr_accessor :val, :right, :left

	def initialize(val)
		@val = val
		@right = nil
		@left = nil
	end
end

class Tree 
	attr_accessor :head

	def initialize
		@head = nil
	end

	def arrToBST(arr)
		@head = findMiddle(arr, 0, arr.length - 1)
	end

	def findMiddle(arr, l, r)
		return nil if l > r
		m = (l + r) / 2
		n = Node.new(arr[m])
		n.left = findMiddle(arr, l, m - 1)
		n.right = findMiddle(arr, m + 1, r)
		return n
	end

	def printTree
		printFoo("", @head, true)
	end

	def printFoo(prefix, node, last)
		print prefix, (last ? "└── " : "├── "), node.val, "\n"
		tail = node.left ? false : true
		printFoo(prefix + (last ? "    " : "│   "), node.right, tail) if node.right
		printFoo(prefix + (last ? "    " : "│   "), node.left, true) if node.left
	end

	def toList
		ret = List.new
		cur = List.new
		cur.add(@head) if @head
		prev = cur
		while !prev.isEmpty
			ret.add(cur)
			cur = List.new
			node = prev.head
			while node
				cur.add(node.val.left) if node.val.left
				cur.add(node.val.right) if node.val.right
				node = node.next
			end
			prev = cur
		end
		return ret
	end
end

tree = Tree.new
arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
tree.arrToBST(arr)
tree.printTree
list = tree.toList
node = list.head
while node
	node.val.show
	node = node.next
end
