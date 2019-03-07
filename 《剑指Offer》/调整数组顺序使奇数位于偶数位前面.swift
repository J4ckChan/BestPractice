/**
	面试题 21: 调整数组顺序使奇数位于偶数位前面
**/


func reOrder(_ nums:inout [Int],_ compareFunc:(Int) -> Bool){
	guard nums.count > 1 else {
		return
	}
	
	var beginIdx = 0
	var endIdx = nums.count-1
	while endIdx > beginIdx {
		while endIdx > beginIdx && !compareFunc(nums[beginIdx]){
			beginIdx+=1
		}
		while endIdx > beginIdx && compareFunc(nums[endIdx]) {
			endIdx-=1
		}
		if endIdx > beginIdx {
			nums.swapAt(beginIdx,endIdx)
		}
	}
}

func isEven(_ num:Int) -> Bool {
	return (num & 1) == 0
}

var nums = [1,2,3,4,5,6,7,8,9,0]
reOrder(&nums, isEven(_:))
print(nums)