#!/usr/bin/ruby

def permutations(str)
	if str.length == 0
		perms = Array.new
		perms << ""
		return perms
	end
	first = str[0]
	last = str.length - 1
	perms = permutations(str[1..last])
	ret = Array.new
	perms.each do |perm|
		0.upto(perm.length) do |i|
			word = perm.dup
			ret << word.insert(i, first)
		end
	end
	return ret
end

def permutationsV2(str)
	len = str.length
	ret = Array.new
	if len == 0
		ret << ""
		return ret
	end
	0.upto(len - 1) do |i|
		left = str[0...i]
		right = str[i+1...len]
		perms = permutationsV2(left + right)
		perms.each { |perm| ret << str[i] + perm }
	end
	return ret
end

def permutationsV3(str)
	perms = Array.new
	getPerms("", str, perms)
	return perms
end

def getPerms(prefix, str, perms)
	len = str.length
	perms << prefix if str.length == 0
	0.upto(len-1) do |i|
		getPerms(prefix + str[i], str[0...i] + str[i+1...len], perms)
	end
end

print permutationsV3("abc"), "\n"
print permutationsV2("abc"), "\n"
print permutations("abc"), "\n"
