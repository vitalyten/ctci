#!/usr/bin/ruby
class Node
	attr_accessor :val, :right, :left

	def initialize(val)
		@val = val
		@right = nil
		@left = nil
	end
end

class Tree
	attr_accessor :root

	def initialize
		@root = nil
	end

	def arrToBST(arr)
		@root = findMiddle(nil, arr, 0, arr.length - 1)
	end

	def findMiddle(parent, arr, l, r)
		return nil if l > r
		m = (l + r) / 2
		n = Node.new(arr[m])
		n.left = findMiddle(n, arr, l, m - 1)
		n.right = findMiddle(n, arr, m + 1, r)
		return n
	end

	def printTree
		printFoo("", @root, true)
	end

	def printFoo(prefix, node, last)
		print prefix, (last ? "└── " : "├── "), node.val, "\n"
		tail = node.left ? false : true
		printFoo(prefix + (last ? "    " : "│   "), node.right, tail) if node.right
		printFoo(prefix + (last ? "    " : "│   "), node.left, true) if node.left
	end
end

t1 = Tree.new
t1.root = Node.new(10)
t1.root.right = Node.new(-3)
t1.root.right.right = Node.new(11)
t1.root.left = Node.new(5)
t1.root.left.right = Node.new(2)
t1.root.left.right.right = Node.new(1)
t1.root.left.left = Node.new(3)
t1.root.left.left.left = Node.new(3)
t1.root.left.left.right = Node.new(-2)
t1.printTree
