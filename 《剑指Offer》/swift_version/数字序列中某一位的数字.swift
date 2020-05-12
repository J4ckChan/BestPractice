class Solution {
	func findNthDigit(_ n: Int) -> Int {
// n scope 10 - 99
// narrow scope /2 %
// value /10	
	
		var (digit,ex) = (1, 0)
		while n - ex > 0 {
			ex += self.getCount(digit)
			digit += 1	
		}
		ex -= self.getCount(digit)
		let dis = n - ex
		let (a,b) = (dis/digit,dis%digit)
		let exNum = self.getMax(digit) + a
		
		if b == 0 {
			return exNum%10
		}
		
		var inNum = exNum + 1
		let revDig = digit - b
		for _ in 0..<revDig {
			inNum /= 10
		}		
		
		return inNum%10	
	}
	
	func getMax(_ n:Int) -> Int{
		guard n > 0 else { return 0 }
		var count = 9
		for _ in 1...n {
			count *= 10
			count += 9
		}
		return count
	}
	
	func getCount(_ n:Int) -> Int {
		guard n > 0 else { return 0 }
		var count = 9
		for _ in 1..<n {
			count *= 10
		}
		return count*n
	}
}

let res = Solution().findNthDigit(11)
print(res)