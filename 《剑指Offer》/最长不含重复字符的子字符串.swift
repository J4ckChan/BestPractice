/// 48:最长不含重复字符的子字符串
///
/// - Parameter str: 输入字符串
/// - Returns: 最长的不包含重复字符的字符串长度
func longestSubStringWithoutDuplication(_ str:String) -> Int {
	guard !str.isEmpty else {
		return 0
	}
	
	var startIndex = 0
	var endIndex = 0
	var subStr = ""
	
	for i in 0..<str.count {
		let end = str.index(str.startIndex, offsetBy: endIndex)
		let start = str.index(str.startIndex, offsetBy: startIndex)
		subStr = String(str[start...end])
		let index = str.index(str.startIndex, offsetBy: i)
		let char = str[index]
		if subStr.contains(char) {
			startIndex = i
			endIndex = i
		}else{
			subStr += String(char)
			endIndex = i
		}
	}
	return subStr.count
}

let test = "arabcacfr"
let res = longestSubStringWithoutDuplication(test)
print(res)