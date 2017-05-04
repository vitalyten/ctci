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

	def pathsWithSumV2(sum)
		return pathsV2(@root, sum, 0, Hash.new(0))
	end

	def pathsV2(node, target, rsum, ht)
		return 0 if node == nil
		total = 0
		rsum += node.val
		ht[rsum] += 1
		total += ht[rsum - target]
		total += pathsV2(node.left, target, rsum, ht)
		total += pathsV2(node.right, target, rsum, ht)
		ht[rsum] -= 1
		ht.delete(rsum) if ht[rsum] == 0
		return total
	end

	def pathsWithSum(sum)
		return paths(@root, sum)
	end

	def paths(node, sum)
		return 0 if node == nil
		return countPaths(node, 0, sum) + paths(node.left, sum) + paths(node.right, sum)
	end

	def countPaths(node, sum, target)
		return 0 if node == nil
		total = 0
		sum += node.val
		total += 1 if sum == target
		return total + countPaths(node.left, sum, target) + countPaths(node.right, sum, target)
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
puts t1.pathsWithSum(8)
puts t1.pathsWithSumV2(8)
