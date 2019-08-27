/// 50:字符串中第一个只出现一次的字符
///
/// - Parameter string: 字符串
/// - Returns: 第一个只出现一次的字符
func firstNotRepeatingChar(_ string:String) -> Character {
	guard string.count > 0 else {
		return Character("\0")
	}
	
	var dict = Dictionary<Character, Int>()
	
	for char in string {
		if dict.keys.contains(char) {
			dict[char] = 0
		}else{
			dict[char] = 1
		}
	}
	
	for char in string {
		if let value = dict[char] {
			if value == 1 {
				return char
			}
		}
	}
	
	return Character("\0")
}

let res = firstNotRepeatingChar("abaccdeff")
print(res)