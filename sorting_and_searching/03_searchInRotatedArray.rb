#!/usr/bin/ruby

def search(arr, left, right, x)
	return -1 if left > right
	mid = (left + right) / 2
	return mid if arr[mid] == x
	if arr[left] < arr[mid]
		if (x < arr[mid] and x >= arr[left])
			return search(arr, left, mid - 1, x)
		else
			return search(arr, mid + 1, right, x)
		end
	elsif arr[left] > arr[mid]
		if (x > arr[mid] and x <= arr[right])
			return search(arr, mid + 1, right, x)
		else
			return search(arr, left, mid - 1, x)
		end
	else
		if arr[mid] != arr[right]
			return search(arr, mid + 1, right, x)
		else
			res = search(arr, left, mid - 1, x)
			return search(arr, mid + 1, right, x) if res == -1
			return res
		end
	end

end

arr = [rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50)]
arr.sort!
arr.rotate!(rand(20))
p arr
p search(arr, 0, arr.length - 1, arr[20])
