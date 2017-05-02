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

	def commonAncestor(n1, n2)
		return nil if !covers(@root, n1) || !covers(@root, n2)
		return commonRec(@root, n1, n2)
	end

	def commonRec(root, n1, n2)
		return root if root == nil || root.val == n1.val || root.val == n2.val
		l = commonRec(root.left, n1, n2)
		r = commonRec(root.right, n1, n2)
		return root if l && r
		return r ? r : l
	end

	def covers(n1, n2)
		return false if n1 == nil || n2 == nil
		return true if n1 == n2
		return covers(n1.left, n2) || covers(n1.right, n2)
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
arr1 = [1,2,3]
tree.arrToBST(arr)

tree.printTree
puts tree.commonAncestor(tree.root.left.left.left, tree.root.left.left.right).val
