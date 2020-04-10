/// 40:最小的k个数
///
/// - Parameters:
///   - numbers: 输入n个整数
///   - k: k
/// - Returns: 最小的k个数
func getLeastNumbers(_ numbers:[Int],_ k:Int) -> [Int] {
	if numbers.isEmpty || k <= 0 {
		return []
	}
	
	func partition(_ numbers:inout [Int],_ start:Int,_ end:Int) -> Int {
		if numbers.isEmpty || start >= end || start < 0 {
			fatalError("Input Invalid")
		}
		
		let index = (end - start)>>1 + start
		numbers.swapAt(index, end)
		
		var smaller = start-1
		for i in start..<end {
			if numbers[i] < numbers[end] {
				smaller += 1
				if smaller != i {
					numbers.swapAt(smaller, i)
				}
			}
		}
		smaller += 1
		numbers.swapAt(smaller, end)
		return smaller
	}
	
	guard !numbers.isEmpty else {
		return []
	}
	
	var nums = numbers
	var start = 0
	var end = nums.count-1
	var index = partition(&nums, start, end)
	while index != k {
		if index > k {
			end = index-1
			index = partition(&nums, start, end)
		}
		
		if index < k {
			start = index+1
			index = partition(&nums, start, end)
		}
	}
	
	return Array(nums[0...k-1])
}

let nums = [4,5,1,6,2,7,3,8]
let res = getLeastNumbers(nums, 4)
print(res)