/// 62:圆圈中最后剩下的数字
///
/// - Parameters:
///   - n: n个数字围成一个圆圈
///   - m: 第m个数字
/// - Returns: 圆圈中最后的数字
func lastRemaining(_ n:Int, _ m:Int) -> Int {
	guard n > 0 && m > 0 else { return -1 }
	
	var array = [Int]()
	for i in 0..<n {
		array.append(i)
	}
	
	func lastRemaining(_ array:[Int], _ n:Int, _ m:Int) -> Int {
		print(array)
		if n == 1 {
			return array.first!
		}
		let index = (m-1)%n
		let newArray = Array(array[index+1..<n] + array[0..<index])
		return lastRemaining(newArray, n-1, m)
	}
	
	return lastRemaining(array, n, m)
}

let res = lastRemaining(16, 3)
print(res)