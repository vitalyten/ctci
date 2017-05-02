#!/usr/bin/ruby
class Node
	attr_accessor :val, :right, :left, :parent

	def initialize(val, parent)
		@val = val
		@parent = parent
		@right = nil
		@left = nil
	end

	def to_s
		@val
	end
end

class Tree
	attr_accessor :root

	def initialize
		@root = nil
	end

	def commonAncestor(n1, n2)
		delta = depth(n1) - depth(n2)
		one = delta > 0 ? n1 : n2
		two = delta > 0 ? n2 : n1
		delta.abs.times do
			two = two.parent
		end
		while one != two && one && two
			one = one.parent
			two = two.parent
		end
		return nil if one == nil || two == nil
		return one
	end

	def commonAncestorV2(n1, n2)
		return nil if !covers(@root, n1) || !covers(@root, n2)
		return n1 if covers(n1, n2)
		return n2 if covers(n2, n1)
		sib = sibling(n1)
		parent = n1.parent
		while !covers(sib, n2)
			sib = sibling(parent)
			parent = parent.parent
		end
		return parent
	end

	def sibling(node)
		return nil if node == nil || node.parent == nil
		return node.parent.left == node ? node.parent.right : node.parent.left
	end

	def covers(n1, n2)
		return false if n1 == nil || n2 == nil
		return true if n1 == n2
		return covers(n1.left, n2) || covers(n1.right, n2)
	end

	def depth(node)
		return -1 if node == nil
		return 1 + [depth(node.left), depth(node.right)].max
	end

	def arrToBST(arr)
		@root = findMiddle(nil, arr, 0, arr.length - 1)
	end

	def findMiddle(parent, arr, l, r)
		return nil if l > r
		m = (l + r) / 2
		n = Node.new(arr[m], parent)
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
puts tree.commonAncestor(tree.root.left.left.left, tree.root.left.right).val
puts tree.commonAncestorV2(tree.root.left.left.left, tree.root.left.right).val
