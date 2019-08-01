/// 39:数组中出现次数超过一半的数字
///
/// - Parameter nums: 数组
/// - Returns: 超过一半的数字
func moreThanHalfNum(_ nums:[Int]) -> Int {
	
	func quickSort(_ nums:inout [Int],_ low:Int,_ high:Int) {
		guard high > low else {
			return
		}
		
		var key = low
		let value = nums[key]
		for i in low...high {
			if nums[i] < value {
				nums.swapAt(i, key)
				key = i
			}
		}
		
		quickSort(&nums, low, key)
		quickSort(&nums, key+1, high)
	}
	
	guard !nums.isEmpty else {
		fatalError("Nums is Empty!")
	}
	
	var nums = nums
	quickSort(&nums, 0, nums.count-1)
	return nums[nums.count>>1]
}

let nums = [1,2,3,2,2,2,5,4,2]
let res = moreThanHalfNum(nums)
print(res)