/**
	面试题 16: 数值的整数次方
**/

var invalidInput = false

var invalidInput = false

func power(_ base:Double,_ exponent:Int) -> Double {
	invalidInput = false
	
	if base == 0.0 && exponent < 0 {
		invalidInput = true
		return 0.0
	}
		
	var absExponent = exponent
	if exponent < 0 {
		absExponent = -exponent
	}
	
	var res = powerWithUnsignedExponent(base,absExponent)
	
	if exponent < 0 {
		res = 1.0/res
	}
	
	return res
}

func powerWithUnsignedExponent(_ base:Double, _ exponent:Int) -> Double{
	if exponent == 0 {
		return 1
	}
	if exponent == 1 {
		return base
	}
	
	var res = powerWithUnsignedExponent(base,exponent>>1)
	res*=res
	if (exponent & 0x1) == 1 {
		res*=base
	}
	return res
}