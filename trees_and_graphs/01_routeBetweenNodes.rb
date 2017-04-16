#!/usr/bin/ruby

class Node
	attr_accessor :name, :neighbors

	def initialize(name)
		@name = name
		@edges = []
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
		n1 = @nodes.index {|n| n.name == name1}
		n2 = @nodes.index {|n| n.name == name2}
		@nodes[n1].edges[n2] = true
		@nodes[n2].edges[n1] = true
	end
end
