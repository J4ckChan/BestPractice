/// 46:把数字翻译成字符串
///
/// - Parameter number: 输入一个数字
/// - Returns: 翻译方法的个数
func getTranslationCount(_ number:Int) -> Int {
	
	func getTranslationCount(_ number:String,_ count:inout Int){
		
		guard !number.isEmpty else {
			return
		}
		
		var numStr = number
		
		if numStr.count == 1 {
			count += 1
			return
		}else if numStr.count == 2 {
			if let num = Int(numStr) {
				if num >= 0 && num < 26 {
					count += 1
				}
			}
		}
		
		let first = String(numStr.removeFirst())
		let second = String(numStr.removeFirst())
		
		getTranslationCount(second+numStr, &count)
		
		let firstTwo = first + second
		if let firstTwoNum = Int(firstTwo) {
			if firstTwoNum >= 0 && firstTwoNum < 26 {
				getTranslationCount(numStr, &count)
			}
		}
	}
	
	var count = 0
	getTranslationCount(String(number), &count)
	
	return count
}

let res = getTranslationCount(12258)
print(res)