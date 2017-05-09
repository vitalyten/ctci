#!/usr/bin/ruby

def magicIndex(arr)
	return magicSearch(arr, 0, arr.length - 1)
end

def magicSearch(arr, first, last)
	return -1 if first > last
	mid = (first + last) / 2
	return mid if arr[mid] == mid
	left = magicSearch(arr, first, [mid - 1, arr[mid]].min)
	return left if left > -1
	return magicSearch(arr, [mid + 1, arr[mid]].max, last)
end

arr = [-10, -5, 1, 2, 2, 3, 4, 7, 9, 12, 13]
print magicIndex(arr) , "\n"
