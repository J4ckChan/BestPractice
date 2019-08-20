/// 42:连续子数组的最大和
///
/// - Parameter nums: 输入整型数组
/// - Returns: 所以子数组的最大值
func findGreatestSumOfSubArray(_ nums:Array<Int>) -> Int {
	guard !nums.isEmpty else {
		return -1
	}
	
	var curSum = 0
	var greatestSum = 0
	for num in nums {
		if curSum <= 0 {
			curSum = num
		}else{
			curSum += num
		}
		
		if curSum > greatestSum {
			greatestSum = curSum
		}
	}
	
	return greatestSum
}

let nums = [1,-2,3,10,-4,7,2,-5]
let res = findGreatestSumOfSubArray(nums)
print(res)