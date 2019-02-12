/**
	面试题 3 - 1: 找出数组中重复的数字
**/

var array = [2,3,1,0,2,5,3]

func findDuplicates(_ nums: inout [Int], duplicate:inout Int) -> Bool {
	guard nums.count > 0 else {
		return false
	}
	
	var idx = 0
	while idx < nums.count-1 {
		let num = nums[idx]
		if num != idx {
			if nums[num] == num {
				duplicate = num
				return true
			}else{
				nums.swapAt(num, idx)
			}
		}else{
			idx+=1
		}
	}
	return false
}

/**
	面试题 3 - 2: 不修改数组找出重复的数字
**/

func getDuplication(_ nums:[Int]) -> Int {
	guard nums.count > 0 else {
		return -1
	}
	
	var start = 1
	var end = nums.count-1
	while end >= start {
		let middle = ((end-start)>>1)+start
		let count = countRange(nums,start,middle)
		if end == start && count > 1{
			if count > 1{
				return start
			}else{
				break
			}		
		}
		if count > (middle-start)+1{
			end = middle
		}else {
			start = middle+1
		}
	}
	return -1
}

func countRange(_ nums:[Int], _ start:Int, _ end:Int) -> Int{
	var count = 0
	for num in nums{
		if num >= start && num <= end {
			count+=1
		}	
	}
	return count
}

var array1 = [2,3,5,4,3,2,6,7]
