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

	def isBST?
		#arr = Array.new
		#isBST(@head, arr)
		#print arr, "\n"
		#return arr == arr.sort
		#return isBSTv2(@head)
		return isBSTv3(@head, nil, nil)
	end
	
	def isBSTv3(node, min, max)
		return true if node == nil
		return false if min != nil && node.val <= min
		return false if max != nil && node.val > max
		return false if (!isBSTv3(node.left, min, node.val) || !isBSTv3(node.right, node.val, max))
		return true
	end

	prev = nil
	def isBSTv2(node)
		return true if node == nil
		return false if !isBSTv2(node.left)
		return false if @prev != nil && node.val < @prev
		@prev = node.val
		return false if !isBSTv2(node.right)
		return true
	end

	def isBST(node, arr)
		return if node == nil
		isBST(node.left, arr)
		arr << node.val
		isBST(node.right, arr)
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
tree.arrToBST(arr)
#node = tree.head
#while node.left
	#node = node.left
#end
#node.left = Node.new(7)
#node = node.left
#node.left = Node.new(9)
tree.printTree
if tree.isBST?
	puts "BST"
else
	puts "not BST"
end

