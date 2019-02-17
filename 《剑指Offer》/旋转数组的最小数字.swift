/**
	面试题 11: 旋转数组的最小数字 
**/

func findMin(_ nums: [Int]) -> Int {
	guard nums.count > 0 else {
		return -1
	}
	var left = 0
	var right = nums.count-1
	while right >= left {
		var mid = ((right-left)>>1)+left
		if nums[mid] > nums[right] {
			left = mid + 1
		}else if nums[mid] < nums[right]{
			right = mid
		}else {
			var min = mid
			if nums[left] < nums[mid] {
				min = left
			}
			return nums[min]
		}
	}
	return -1
}

