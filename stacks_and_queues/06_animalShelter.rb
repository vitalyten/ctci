#!/usr/bin/ruby

class Animal
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def to_s
		@name
	end
end

class Dog < Animal
	def to_s
		"dog:" + @name
	end
end

class Cat < Animal
	def to_s
		"cat:" + @name
	end
end

class Node
	attr_accessor :val, :next

	def initialize(val)
		@val = val
		@next = nil
	end
end

class Queue 
	attr_accessor :first, :last

	def initialize
		@first = nil
		@last = nil
	end

	def enqueue(val)
		node = Node.new(val)
		@last.next = node if @last != nil
		@last = node
		@first = node if @first == nil
	end

	def isEmpty
		return @first == nil
	end

	def dequeue
		raise "Queue is empty!" if isEmpty
		val = @first.val
		@first = @first.next
		@last = nil if @first == nil
		return val
	end

	def peek
		raise "Queue is empty!" if isEmpty
		return @first.val
	end

	def show
		curr = @first
		while curr
			print curr.val
			print " -> " if curr.next
			curr = curr.next
		end
		puts
	end

	def sortStack
		s2 = Stack.new
		while !isEmpty
			el = pop
			while !s2.isEmpty && s2.peek > el
				push(s2.pop)
			end
			s2.push(el)
		end
		while !s2.isEmpty
			push(s2.pop)
		end
	end
end

class Shelter
	def initialize
		@q1 = Queue.new
		@q2 = Queue.new
	end

	def enqueue(val)
		@q1.enqueue(val)
	end

	def dequeueAny
		if !@q2.isEmpty
			val = @q2.dequeue
		else
			val = @q1.dequeue
		end
	end

	def dequeueDog
		if !@q2.isEmpty && @q2.peek.is_a?(Dog)
			val = @q2.dequeue
		else
			while !@q1.peek.is_a?(Dog)
				@q2.enqueue(@q1.dequeue)
			end
			val = @q1.dequeue
		end
		return val
	end

	def dequeueCat
		if !@q2.isEmpty && @q2.peek.is_a?(Cat)
			val = @q2.dequeue
		else
			while !@q1.peek.is_a?(Cat)
				@q2.enqueue(@q1.dequeue)
			end
			val = @q1.dequeue
		end
		return val
	end

	def show
		@q1.show
		@q2.show
	end

end

sh = Shelter.new
sh.enqueue(Dog.new("d1"))
sh.enqueue(Cat.new("c1"))
sh.enqueue(Dog.new("d2"))
sh.enqueue(Cat.new("c2"))
sh.enqueue(Cat.new("c3"))
sh.enqueue(Dog.new("d3"))
sh.enqueue(Dog.new("d4"))
sh.enqueue(Dog.new("d5"))
sh.enqueue(Cat.new("c4"))
sh.enqueue(Dog.new("d6"))
sh.show
print "deq:", sh.dequeueCat, "\n"
print "deq:", sh.dequeueCat, "\n"
sh.show
print "deq:", sh.dequeueDog, "\n"
print "deq:", sh.dequeueAny, "\n"
print "deq:", sh.dequeueDog, "\n"
print "deq:", sh.dequeueAny, "\n"
sh.show
