#!/usr/bin/ruby

def getSubsets(set)
	allSubsets = Array.new
	n = 1 << set.length
	for i in 0..n-1
		allSubsets << getSubset(set, i)
	end
	return allSubsets
end

def getSubset(set, n)
	i = 0
	subset = Array.new
	while n > 0
		subset << set[i] if n & 1 == 1
		n >>= 1
		i += 1
	end
	return subset
end

def getSubsetsV2(set, i)
	if i == set.length
		allSubsets = Array.new
		allSubsets << Array.new
	else
		allSubsets = getSubsetsV2(set, i + 1)
		elem = set[i]
		tmp = Array.new
		allSubsets.each do |subset|
		subdup = subset.dup
		subdup << elem
		tmp << subdup
		end
		allSubsets += tmp
	end
	return allSubsets
end

set = [1,2,3,4]
subsets = getSubsetsV2(set, 0)
subsets.each {|s| print s, "\n"}
