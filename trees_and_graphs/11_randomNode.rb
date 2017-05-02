#!/usr/bin/ruby
class Node
	attr_accessor :val, :right, :left, :parent, :size

	def initialize(val)
		@val = val
		@right = nil
		@left = nil
		@size = 1
	end

	def insert(val)
		if val <= @val
			@left == nil ? @left = Node.new(val) : @left.insert(val)
		else
			@right == nil ? @right = Node.new(val) : @right.insert(val)
		end
		@size += 1
	end
end

class Tree
	attr_accessor :root

	def initialize
		@root = nil
	end

	def insert(val)
		@root == nil ? @root = Node.new(val) : @root.insert(val)
	end

	def getRandom
		r = rand(@root.size)
		puts r
		return getIth(r, @root)
	end

	def getIth(i, node)
		ls = node.left ? node.left.size : 0
		return node if i == ls
		return getIth(i, node.left) if i < ls
		return getIth(i - ls - 1, node.right)
	end

	def printTree
		printFoo("", @root, true)
	end

	def printFoo(prefix, node, last)
		print prefix, (last ? "└── " : "├── "), node.val, "\n"
		#tail = node.left ? false : true
		printFoo(prefix + (last ? "    " : "│   "), node.right, false) if node.right
		printFoo(prefix + (last ? "    " : "│   "), node.left, true) if node.left
	end
end

tree = Tree.new
9.times {tree.insert(rand(100))}
tree.printTree
puts tree.getRandom.val
