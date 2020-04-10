/// 39:数组中出现次数超过一半的数字
///
/// - Parameter nums: 数组
/// - Returns: 超过一半的数字
func moreThanHalfNum(_ nums:[Int]) -> Int {
	
	func partition(_ nums:inout [Int], _ start:Int,_ end:Int) -> Int {
		if nums.isEmpty || start >= end || start < 0 {
			fatalError("Input Invalid")
		}
		
		let index = (end-start)>>1 + start
		nums.swapAt(index, end)
		
		var smaller = start-1
		for i in start..<end {
			if nums[i] < nums[end] {
				smaller += 1
				if smaller != i {
					nums.swapAt(i, smaller)
				}
			}
		}
		smaller += 1
		nums.swapAt(smaller, end)
		return smaller
	}
	
	if nums.isEmpty {
		fatalError("Input Invalid")
	}
	
	var nums = nums
	let middle = nums.count >> 1
	var start = 0
	var end = nums.count-1
	var index = partition(&nums, 0, nums.count-1)
	while index != middle {
		if index > middle {
			end = index-1
			index = partition(&nums, start, end)
		}
		if index < middle {
			start = index+1
			index = partition(&nums, start, end)
		}
	}
	return nums[middle]
}

let nums = [1,2,3,2,2,2,5,4,2]
let res = moreThanHalfNum(nums)
print(res)