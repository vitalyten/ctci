#!/usr/bin/ruby

def quickSort(arr, left, right)
	i = partition(arr, left, right)
	quickSort(arr, left, i - 1) if left < i - 1
	quickSort(arr, i, right) if i < right
end

def swap(arr, l, r)
	tmp = arr[l]
	arr[l] = arr[r]
	arr[r] = tmp
end

def partition(arr, left, right)
	pivot = arr[(left + right) / 2]
	while left <= right
		left += 1 while arr[left] < pivot
		right -= 1 while pivot < arr[right]
		if (left <= right)
			swap(arr, left, right)
			left += 1
			right -= 1
		end
	end
	return left
end

arr = [rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50)]
print arr, "\n"
quickSort(arr, 0, arr.length - 1)
print arr, "\n"
