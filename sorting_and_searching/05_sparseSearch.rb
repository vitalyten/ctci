#!/usr/bin/ruby

def search(arr, left, right, str)
	return -1 if (str == "" or str == nil or arr == nil)
	return -1 if (left > right)
	mid = (left + right) / 2
	if arr[mid] == ""
		midl = mid - 1
		midr = mid + 1
		while true
			return -1 if (midl < left and midr > right)
			if (midl >= left and arr[midl] != "")
				mid = midl
				break
			end
			if (midr <= right and arr[midr] != "")
				mid = midr
				break
			end
			midl -= 1
			midr += 1
		end
	end
	return search(arr, left, mid - 1, str) if (str <=> arr[mid]) < 0
	return search(arr, mid + 1, right, str) if (str <=> arr[mid]) > 0
	return mid
end

arr = ["apple", "", "", "", "ball", "", "", "cat", "", "", "dog", "", ""]
p search(arr, 0, arr.length - 1, "dog")
