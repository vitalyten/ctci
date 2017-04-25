#!/usr/bin/ruby
class Node
	attr_accessor :val, :right, :left, :parent
	
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

	def allSequences
		return allRec(@root)
	end

	def containsTreeV2(node)
		return true if node == nil
		return findNode(@root, node)
	end

	def findNode(n1, n2)
		return false if n1 == nil
		if n1 == n2
			return true if compare(n1, n2)
		end
		return findNode(n1.left, n2) || findNode(n1.right, n2)
	end

	def compare(n1, n2)
		return true if n1 == nil and n2 == nil
		return false if n1 == nil or n2 == nil
		return false if n1 != n2
		return compare(n1.left, n2.left) && compare(n1.right, n2.right)
	end

	def containsTree(node)
		ar1 = Array.new
		ar2 = Array.new
		traverse(@root, ar1)
		traverse(node, ar2)
		p ar1.join
		p ar2.join
		return ar1.join.include? ar2.join
	end

	def traverse(node, arr)
		if node == nil
			arr << "X"
			return
		end
		arr << node.val
		traverse(node.left, arr)
		traverse(node.right, arr)
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

tree = Tree.new
arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
arr1 = [1,2,3,4,5,6,7,8,9]
tree.arrToBST(arr)
tree1 = Tree.new
tree1.arrToBST(arr1)
tree.printTree
tree1.printTree
#if tree.containsTreeV2(tree.root.left.left.right)
if tree.containsTreeV2(tree1.root)
	puts "contains"
else
	puts "does not contain"
end
