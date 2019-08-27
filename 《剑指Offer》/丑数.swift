/// 49:丑数
///
/// - Parameter index: 丑数的索引
/// - Returns: 返回第index个丑数
func getUglyNumber(_ index:Int) -> Int {
	guard index >= 0 else {
		return 0
	}
	
	var uglyNumbers = Array.init(repeating: 1, count: index)
	var (multiply2,multiply3,multiply5) = (0,0,0)
	var nextUglyNumberIndex = 1
	
	while nextUglyNumberIndex < index {
		
		let (num2,num3,num5) = (2*uglyNumbers[multiply2],3*uglyNumbers[multiply3],5*uglyNumbers[multiply5])
		let minNum = min(num2, num3, num5)
		uglyNumbers[nextUglyNumberIndex] = minNum
		
		if num2 <= minNum { multiply2 += 1 }
		if num3 <= minNum { multiply3 += 1 }
		if num5 <= minNum { multiply5 += 1 }
		
		nextUglyNumberIndex += 1
	}
	
	return uglyNumbers.last!
}

let res = getUglyNumber(1500)
print(res)