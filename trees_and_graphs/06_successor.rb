#!/usr/bin/ruby
class Node
	attr_accessor :val, :right, :left, :parent

	def initialize(val, parent)
		@val = val
		@parent = parent
		@right = nil
		@left = nil
	end
end

class Tree
	attr_accessor :head

	def initialize
		@head = nil
	end

	def successor(node)
		return nil if node == nil
		if node.right
			ret = node.right
			while ret.left
				ret = ret.left
			end
			return ret
		else
			while node.parent
				return node.parent if node == node.parent.left
				node = node.parent
			end
		end
		return nil
	end

	def arrToBST(arr)
		@head = findMiddle(nil, arr, 0, arr.length - 1)
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
tree.printTree
node = tree.successor(tree.head)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
node = tree.successor(node)
print tree.successor(node).val , "\n"
