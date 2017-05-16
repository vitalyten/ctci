#!/usr/bin/ruby

class String
	def to_bool
		return true if eval(self) == 1
		return false if eval(self) == 0
		raise "invalid value for to_bool"
	end
end

def countEval(str, res, memo)
	return 0 if str.length == 0
	if str.length == 1
		return str.to_bool == res ? 1 : 0
	end
	return memo[res.to_s + str] if memo.include?(res.to_s + str)
	i = 1
	val = 0
	while i < str.length
		leftTrue = countEval(str[0...i], true, memo)
		leftFalse = countEval(str[0...i], false, memo)
		rightTrue = countEval(str[i+1...str.length], true, memo)
		rightFalse = countEval(str[i+1...str.length], false, memo)
		total = (leftTrue + leftFalse) * (rightTrue + rightFalse)
		totalTrue = (leftTrue * rightFalse + leftFalse * rightTrue) if str[i] == "^"
		totalTrue = (leftTrue * rightTrue) if str[i] == "&"
		totalTrue = (leftTrue * rightTrue + leftFalse * rightTrue + leftTrue * rightFalse) if str[i] == "|"
		val += (res == true) ? totalTrue : total - totalTrue
		i += 2
	end
	memo[res.to_s + str] = val
	return memo[res.to_s + str]
end

p countEval("0&0&0&1^1|0", true, Hash.new(0))
p countEval("1^0|0|1", false, Hash.new(0))

