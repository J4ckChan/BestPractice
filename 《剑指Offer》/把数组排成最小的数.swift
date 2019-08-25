/// 45:把数组排成最小的数
///
/// - Parameter array: 输入一个正整数
func PrintMinNumber(_ array:[Int]) {
	
	func LHSSmallThanRHS(_ lhs:Int,_ rhs:Int) -> Bool {
		let lhsStr = String(lhs)
		let rhsStr = String(rhs)
		let lhsRes = lhsStr + rhsStr
		let rhsRes = rhsStr + lhsStr
		
		if lhsRes > rhsRes {
			return false
		}else{
			return true
		}
	}
	
	guard !array.isEmpty else {
		fatalError("Input Error")
	}
	
	let sortedArray = array.sorted(by: LHSSmallThanRHS(_:_:))

	let minNum = sortedArray.reduce("") { (res, next) -> String in
		return res + String(next)
	}
	print(minNum)
}

let array = [3,32,321]
PrintMinNumber(array)