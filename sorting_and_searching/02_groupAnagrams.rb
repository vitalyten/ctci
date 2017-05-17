#!/usr/bin/ruby

def group(arr)
	ht = Hash.new { |hash, key| hash[key] = Array.new }
	arr.each do |str|
		key = str.split(//).sort.join
		ht[key] << str
	end
	i = 0
	ht.each_key do |key|
		ht[key].each do |s|
			arr[i] = s
			i += 1
		end
	end
end

arr = ["123", "234", "345", "456", "132", "243", "543", "546"]
p arr
group(arr)
p arr