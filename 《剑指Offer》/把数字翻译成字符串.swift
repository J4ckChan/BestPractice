/// 46:把数字翻译成字符串
///
/// - Parameter number: 输入一个数字
/// - Returns: 翻译方法的个数
func getTranslationCount(_ number:Int) -> Int {

	func getTranslationCount(_ number:String) -> Int {

		var counts = Array.init(repeating: 0, count: number.count)
		var count = 0
		let length = number.count

		for i in (0..<length).reversed() {
			count = 0
			if i < length-1 {
				count = counts[i+1]
			}else{
				count = 1
			}

			if i < length-1 {
				let endIndex = number.index(number.startIndex, offsetBy: i+1)
				let startIndex = number.index(number.startIndex, offsetBy: i)
				let numStr = String(number[startIndex...endIndex])
				if let num = Int(numStr) {
					if num >= 10 && num <= 25 {
						if i < length - 2 {
							count += counts[i+2]
						}else{
							count += 1
						}
					}
				}
			}
			counts[i] = count
		}
		count = counts[0]

		return count
	}
	
	guard number >= 0 else {
		return 0
	}

	return getTranslationCount(String(number))
}

let res = getTranslationCount(12258)
print(res)
