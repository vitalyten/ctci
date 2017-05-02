#!/usr/bin/ruby

module State
	BLANK = 0
	COMPLETED = 1
	PARTIAL = 2
end

class Node
	attr_accessor :name, :adjacent, :state

	def initialize(name)
		@name = name
		@adjacent = Array.new
		@state = State::BLANK
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

	def addEdge(name1, name2)
		n1 = @nodes.find {|n| n.name == name1}
		n2 = @nodes.find {|n| n.name == name2}
		raise "node not found" if n1 == nil || n2 == nil
		n1.addAdjacent(n2)
	end

	def buildOrder
		stack = Array.new
		@nodes.each do |n|
			if n.state == State::BLANK
				return nil if !orderDFS(n, stack)
			end
		end
		return stack
	end

	def orderDFS(node, stack)
		return nil if node.state == State::PARTIAL
		if node.state == State::BLANK
			node.state = State::PARTIAL
			node.adjacent.each do |n|
				return nil if !orderDFS(n, stack)
			end
			node.state = State::COMPLETED
			stack.unshift(node.name)
		end
		true
	end

end

graph = Graph.new
graph.addNode("a")
graph.addNode("b")
graph.addNode("c")
graph.addNode("d")
graph.addNode("e")
graph.addNode("f")
graph.addNode("g")
graph.addEdge("d", "g")
graph.addEdge("f", "a")
graph.addEdge("f", "b")
graph.addEdge("f", "c")
graph.addEdge("c", "a")
graph.addEdge("b", "a")
graph.addEdge("b", "e")
graph.addEdge("a", "e")
print graph.buildOrder, "\n"
