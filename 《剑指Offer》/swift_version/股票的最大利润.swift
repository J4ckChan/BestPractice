/// 63:股票的最大利润
///
/// - Parameter array: 股票价格按照时间先后顺序存储的数组
/// - Returns: 最大利润
import Foundation
func maxDiff(_ array:[Int]) -> Int {
	guard array.count >= 2 else { return -1 }
	
	var (min,maxDiff) = (array[0],array[1]-array[0])
	for i in 2..<array.count {
		if array[i-1] < min { min = array[i-1] }
		
		let diff = array[i]-min
		if diff > maxDiff {
			maxDiff = diff
		}
	}
	return maxDiff
}

var array = [Int]()
for _ in 0..<6 {
	array.append(Int(arc4random_uniform(UInt32(100))))
}
print(array)
let res = maxDiff(array)
print(res)