#!/usr/bin/ruby

class Array
	def elementAt(i)
		if (i < self.length and i >= 0)
			return self[i]
		else
			return -1
		end
	end
end

def binarySearch(list, left, right, x)
	while left <= right
		mid = (left + right) / 2
		if (list.elementAt(mid) == -1 or x < list.elementAt(mid))
			right = mid - 1
		elsif (x > list.elementAt(mid))
			left = mid + 1
		else
			return mid
		end
	end
	return -1
end

def search(list, x)
	i = 1
	while (list.elementAt(i) != -1 and list.elementAt(i) < x)
		i *= 2
	end
	return binarySearch(list, i / 2, i, x)
end

arr = [rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50)]
arr.sort!
p arr
p search(arr, arr[25])
