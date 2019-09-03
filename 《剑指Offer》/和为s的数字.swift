/// 57:和为s的数字 -- 和为s的两个数字
///
/// - Parameters:
///   - array: 递增排序数组
///   - sum: 和值
/// - Returns: 输出任意一对数组
func findNumbersWithSum(_ array:[Int], _ sum:Int) -> (Int, Int){
	guard array.count >= 2 else { fatalError("input error") }

	var (start,end) = (0,array.count-1)
	while (array[start] + array[end]) != sum {
		sum < (array[start]+array[end]) ? (end -= 1) : (start += 1)
	}
	return (array[start],array[end])
}

let list = [1,2,4,7,11,15]
let res = findNumbersWithSum(list, 15)
print(res)

/// 57:和为s的数字 -- 和为s的连续正数序列
///
/// - Parameters:
///   - sum: 和值
/// - Returns: 输出连续序列的起始值和结束值
func findContinuousSequence(_ sum:Int) -> [(Int, Int)]{
	guard sum > 2 else { fatalError("input error") }
	
	var end = sum >> 1 + 1
	var sequenceSum = end
	var res = [(Int, Int)]()
	
	for i in (1..<end).reversed() {
		sequenceSum += i
		if sequenceSum == sum {
			res.append((i,end))
			(sequenceSum,end) = (sequenceSum - end, end - 1)
		}else if sequenceSum > sum {
			(sequenceSum,end) = (sequenceSum - end, end - 1)
		}
	}
	
	return res.reversed()
}

let res2 = findContinuousSequence(15)
print(res2)