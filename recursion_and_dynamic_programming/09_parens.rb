#!/usr/bin/ruby

def getPerms(n)
	perms = Array.new
	parenPerm(Array.new(n * 2), n, n, perms, 0)
	return perms
end

def parenPerm(str, lrem, rrem, perms, i)
	return if lrem < 0 or rrem < lrem
	if lrem == 0 and rrem == 0
		perms << str.join("")
		return
	end
	str[i] = "("
	parenPerm(str, lrem - 1, rrem, perms, i + 1)
	str[i] = ")"
	parenPerm(str, lrem, rrem - 1, perms, i + 1)
end

print getPerms(4), "\n"
