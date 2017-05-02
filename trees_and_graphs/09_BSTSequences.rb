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

	def allRec(node)
		res = Array.new
		if node == nil
			res.push(Array.new)
			return res
		end
		prefix = Array.new
		prefix << node.val
		leftSeq = allRec(node.left)
		rightSeq = allRec(node.right)
		leftSeq.each do |left|
			rightSeq.each do |right|
				weaved = Array.new
				weave(left, right, weaved, prefix)
				res += weaved
			end
		end
		return res
	end

	def weave(first, second, results, prefix)
		if first.length == 0 || second.length == 0
			result = prefix.clone
			result += first
			result += second
			results << result
			return
		end
		prefix.push(first.shift)
		weave(first, second, results, prefix)
		first.unshift(prefix.pop)
		prefix.push(second.shift)
		weave(first, second, results, prefix)
		second.unshift(prefix.pop)
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
tree.arrToBST(arr1)
tree.printTree
print tree.allSequences, "\n"
