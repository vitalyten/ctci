#!/usr/bin/ruby

class Node
	attr_accessor :name, :adjacent, :visited, :dependencies

	def initialize(name)
		@name = name
		@adjacent = Array.new
		@dependencies = 0
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

	def addEdge(name1, name2)
		n1 = @nodes.find {|n| n.name == name1}
		n2 = @nodes.find {|n| n.name == name2}
		raise "node not found" if n1 == nil || n2 == nil
		n1.addAdjacent(n2)
		n2.dependencies += 1
	end

	def orderProjects
		order = Array.new
		ordered = 1
		while @nodes.length > 0 && ordered > 0
			ordered = 0
			@nodes.each do |n|
				if n.dependencies == 0
					n.adjacent.each {|a| a.dependencies -= 1}
					order << n.name
					@nodes.delete(n)
					ordered += 1
				end
			end
		end
		return nil if @nodes.length > 0
		return order
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
print graph.orderProjects, "\n"
