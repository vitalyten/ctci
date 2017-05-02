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

	def checkHeight(node)
		return -1 if node == nil
		lh = height(node.right)
		rh = height(node.left)
		return -42 if (lh - rh).abs > 1
		return 1 + [lh, rh].max
	end


	def height(node)
		return -1 if node == nil
		return 1 + [height(node.right), height(node.left)].max
	end

	def isBalanced?
		return checkHeight(@head) != -42
	end

	def isBalanced(node)
		return true if node == nil
		return false if (height(node.left) - height(node.right)).abs > 1
		return isBalanced(node.left) && isBalanced(node.right)
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
end

tree = Tree.new
arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
arr1 = [1,2,3]
tree.arrToBST(arr1)
node = tree.head
while node.left
	node = node.left
end
node.left = Node.new(7)
node = node.left
node.left = Node.new(9)
tree.printTree
if tree.isBalanced?
	puts "balanced"
else
	puts "not balanced"
end

