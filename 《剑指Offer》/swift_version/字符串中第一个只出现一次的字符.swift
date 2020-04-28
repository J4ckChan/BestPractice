/// 50:字符串中第一个只出现一次的字符
///
/// - Parameter string: 字符串
/// - Returns: 第一个只出现一次的字符
class Solution {
	func firstUniqChar(_ s: String) -> Character {
		let char = Character(" ")
		guard s.count > 0 else {
			return char
		}
		
		var dict = [Character:Bool]()
		for c in s {
			if let value = dict[c] {
				if value { dict[c] = false }
			}else {
				dict[c] = true
			}
		}
		
		for c in s {
			if let value = dict[c] {
				if value { return c }
			}
		}
		return char
	}
}
let res = Solution().firstUniqChar("abaccdeff")
print(res)