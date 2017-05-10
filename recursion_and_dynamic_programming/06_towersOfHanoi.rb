#!/usr/bin/ruby

class Tower
	attr_accessor :index, :disks

	def initialize
		@disks = Array.new
	end

	def add(n)
		if !@disks.empty? and @disks.last <= n
			puts "Can't place disk #{n}"
		else
			@disks.push(n)
		end
	end

	def moveDisks(n, buffer, destination)
		return if n <= 0
		moveDisks(n - 1, destination, buffer)
		destination.add(@disks.pop)
		buffer.moveDisks(n - 1, self, destination)
	end

	def disp
		@disks.each { |d| print d, " "}
		print "\n"
	end
end

t1 = Tower.new
t2 = Tower.new
t3 = Tower.new

5.downto(1) { |i| t1.add(i) }
t1.disp
t1.moveDisks(5, t3, t2)
t3.disp
t2.disp
