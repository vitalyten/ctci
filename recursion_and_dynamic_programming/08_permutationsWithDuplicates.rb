#!/usr/bin/ruby


def getPerms(str)
	chars = Hash.new(0)
	perms = Array.new
	str.each_char { |c| chars[c] += 1 }
	permFoo(chars, "", str.length, perms)
	return perms
end

def permFoo(chars, prefix, rem, perms)
	if rem == 0
		perms << prefix
		return
	end
	chars.each do |key, val|
		if val > 0
			chars[key] -= 1
			permFoo(chars, prefix + key, rem - 1, perms)
			chars[key] += 1
		end
	end
end

print getPerms("aaabb"), "\n"
