class Solution {
	func strToInt(_ str: String) -> Int {
		if str.isEmpty { return 0 }

		var (res, i, sign) = (0,0,1)
		let (int32_min,bndry) = (-(Int(INT32_MAX)+1), Int(INT32_MAX)/10)
		let count = str.count
		
		var idx = str.index(str.startIndex, offsetBy: i)
		var subStr = String(str[idx])
		while subStr == " " {
			i += 1
			if i == count { return res }
			idx = str.index(str.startIndex, offsetBy: i)
			subStr = String(str[idx])
		}
		
		if subStr == "-" { sign = -1 }
		if subStr == "-" || subStr == "+" { i += 1 }
		
		for j in i..<count {
			idx = str.index(str.startIndex, offsetBy: j)
			subStr = String(str[idx])
			if let num = Int(subStr) {
				if res > bndry || (res == bndry && num > 7) {
					res = sign == 1 ? Int(INT32_MAX) : int32_min
					return res
				}else{
					res = 10 * res + num
				}
			}else{ break }
		}
		
		return sign * res
	}
}