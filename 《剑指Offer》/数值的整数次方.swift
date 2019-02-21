/**
	面试题 16: 数值的整数次方
**/

var invalidInput = false

func power(_ base:Double,_ exponent:Int) -> Double {
	invalidInput = false
	
	if base == 0.0 && exponent < 0 {
		invalidInput = true
		return 0.0
	}
	
	if exponent == 0 {
		return 1
	}else if exponent == 1 {
		return base
	}
	
	var absExponent = exponent
	if exponent < 0 {
		absExponent = -exponent
	}
	
	var res = 1.0
	let halfOfAbsExponent = absExponent >> 1
	for _ in 0..<halfOfAbsExponent{
		res*=base
	}
	res*=res
	if (absExponent & 0x1) == 1 {
		res*=base
	}
	
	if exponent < 0 {
		res = 1.0/res
	}
	
	return res
}