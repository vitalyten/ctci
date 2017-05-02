#!/usr/bin/ruby

class Node
	attr_accessor :name, :adjacent, :visited

	def initialize(name)
		@name = name
		@adjacent = Array.new
		@visited = false
	end

	def addAdjacent(n)
		@adjacent << n
	end
end

class Graph
	attr_accessor :nodes

	def initialize
		@nodes = []
	end

	def addNode(name)
		@nodes << Node.new(name)
	end

	def findNode(name)
		@nodes.each do |n|
			return n if n.name == name
		end
		nil
	end

	def count
		@nodes.length
	end

	def addEdge(name1, name2)
		n1 = @nodes.find {|n| n.name == name1}
		n2 = @nodes.find {|n| n.name == name2}
		raise "node not found" if n1 == nil || n2 == nil
		n1.addAdjacent(n2)
	end

	def isConnected(name1, name2)
		q = Array.new
		n1 = @nodes.find {|n| n.name == name1}
		n2 = @nodes.find {|n| n.name == name2}
		raise "node not found" if n1 == nil || n2 == nil
		q.push(n1)
		while !q.empty?
			n = q.shift
			n.visited = true
			nodes = n.adjacent
			nodes.each {|x| q.push(x) if x.visited == false}
		end
		return n2.visited
	end
end

graph = Graph.new
graph.addNode(0)
graph.addNode(1)
graph.addNode(2)
graph.addNode(3)
graph.addNode(4)
graph.addNode(5)
graph.addEdge(0, 1)
graph.addEdge(0, 5)
graph.addEdge(0, 4)
graph.addEdge(2, 1)
graph.addEdge(1, 3)
graph.addEdge(1, 4)
graph.addEdge(3, 2)
graph.addEdge(3, 4)
if graph.isConnected(0, 2)
	puts "connected"
else
	puts "not connected"
end
