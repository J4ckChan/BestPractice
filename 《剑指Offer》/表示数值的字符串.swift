/**
	面试题 20: 表示数值的字符串
**/

func isNumeric(_ num:String) -> Bool {
	guard num.count > 0 else {
		return false
	}
	var number = [Character]()
	for item in num {
		number.append(item)
	}
	
	var numeric = scanInteger(&number)
	
	if let item = number.first {
		if item == "." {
			number.removeFirst()
			numeric = scanUnsignedInteger(&number)||numeric
		}
	}
	
	if let item = number.first {
		if item == "e" || item == "E" {
			number.removeFirst()
			numeric = numeric && scanInteger(&number)
		}
	}
	
	return numeric && number.count == 0
}

func scanInteger(_ num:inout [Character]) -> Bool {
	if let item = num.first {
		if item == "-" || item == "+" {
			num.removeFirst()
		}
	}
	return scanUnsignedInteger(&num)
}

func scanUnsignedInteger(_ num:inout [Character]) -> Bool {
	let count = num.count
	var item = num.first
	while item != nil && item! >= "0" && item! <= "9" {
		num.removeFirst()
		item = num.first
	}
	return num.count < count
}
