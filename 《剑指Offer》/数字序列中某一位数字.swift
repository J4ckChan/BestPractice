/// 44:数字序列中某一位数字
///
/// - Parameter index: 序列
/// - Returns: 第index位置对应的数字

import Foundation

func digitAtIndex(_ index:Int) -> Int {
	
	func countOfInteger(_ digit:Int) -> Int {
		if digit == 1 {
			return 10
		}else{
			return Int(9*pow(10.0, Double(digit-1)))
		}
	}
	
	func beginNumber(_ digit:Int) -> Int{
		if digit == 1 {
			return 0
		}else{
			return Int(pow(10.0, Double(digit)))
		}
	}
	
	func digitAtIndex(_ index:Int,_ digit:Int) -> Int {
		let indexFromRight = digit - index % digit
		var num = beginNumber(digit) + index/digit
		
		for _ in 1..<indexFromRight{
			num = num/10
		}
		
		return num%10
	}
	

	
	guard index >= 0 else {
		return -1
	}
	
	var digit = 1
	var index = index
	while true {
		let count = countOfInteger(digit)
		if index < count {
			return digitAtIndex(index, digit)
		}else{
			digit += 1
			index -= count
		}
	}
	
}

let res = digitAtIndex(19)
print(res)