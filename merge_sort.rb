#!/usr/bin/ruby

def mergeSort(arr)
	tmp = Array.new(arr.length)
	sortFoo(arr, tmp, 0, arr.length - 1)
end

def sortFoo(arr, tmp, first, last)
	return if first >= last
	mid = (first + last) / 2
	sortFoo(arr, tmp, first, mid)
	sortFoo(arr, tmp, mid + 1, last)
	merge(arr, tmp, first, mid, last)
end

def merge(arr, tmp, first, mid, last)
	for i in first..last
		tmp[i] = arr[i]
	end
	lefti = first
	righti = mid + 1
	i = first
	while (lefti <= mid and righti <= last)
		if tmp[lefti] <= tmp[righti]
			arr[i] = tmp[lefti]
			lefti += 1
		else
			arr[i] = tmp[righti]
			righti += 1
		end
		i += 1
	end
	while (lefti <= mid)
		arr[i] = tmp[lefti]
		i += 1
		lefti += 1
	end
end

arr = [rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50),
		rand(50), rand(50), rand(50), rand(50), rand(50), rand(50), rand(50)]
print arr, "\n"
mergeSort(arr)
print arr, "\n"

