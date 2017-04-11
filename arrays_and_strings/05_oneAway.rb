#!/usr/bin/ruby




def oneInsert(s1, s2)
	i1 = 0
	i2 = 0
	a1 = s1.chars
	a2 = s2.chars
	while (i1 < s1.length && i2 < s2.length)
		if a1[i1] != a2[i2]
			return false if i1 != i2
			i1 += 1
		else
			i1 += 1
			i2 += 1
		end
	end
	return true
end


def oneReplace(s1, s2)
	edited = false
	a1 = s1.chars
	a2 = s2.chars
	for i in 0..s1.length - 1
		if a1[i] != a2[i]
			return false if edited
			edited = true
		end
	end
	return true
end

def oneAway(s1, s2)
	l1 = s1.length
	l2 = s2.length
	if (l1 == l2)
		return oneReplace(s1, s2)
	elsif (l1 - l2 == 1)
		return oneInsert(s1, s2)
	elsif (l2 - l1 == 1)
		return oneInsert(s2, s1)
	end
	return false
end
s1 = gets.strip
s2 = gets.strip
if oneAway(s1, s2)
	puts("one edit")
else
	puts("more than one edit")
end
