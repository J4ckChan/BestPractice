/// 56:数组中数字出现的次数 - 数组中只出现一次的两个数字
///
/// - Parameter array: 整数型数组
/// - Returns: 两个只出现一次的数字
func findNumsAppearOnce(_ array:[Int]) -> (Int,Int){
	guard array.count >= 2 else { fatalError("input error") }
	
	var res = array.reduce(0) { $0^$1 }
	
	var indexOfBit1 = 0
	while indexOfBit1&1 == 0 {
		(res, indexOfBit1) = (res >> 1, indexOfBit1+1)
	}
	
	func isBit1(_ num:Int) -> Bool {
		var res = num
		for _ in 0..<indexOfBit1 {
			res = res >> 1
		}
		return (res & 1) == 1
	}
	
	var (arrayBit1, arrayBit0) = ([Int](), [Int]())
	for i in 0..<array.count {
		let num = array[i]
		let res = isBit1(num)
		res == true ? arrayBit1.append(num):arrayBit0.append(num)
	}
	
	let numAppearOnce0 = arrayBit0.reduce(0) { $0^$1 }
	let numAppearOnce1 = arrayBit1.reduce(0) { $0^$1 }
	
	return (numAppearOnce0,numAppearOnce1)
}


let array = [2,4,3,6,3,2,5,5]
let res = findNumsAppearOnce(array)
print(res)