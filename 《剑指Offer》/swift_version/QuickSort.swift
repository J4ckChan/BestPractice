/// 快速排序
///
/// - Parameters:
///   - numbers: 输入数组
///   - start: 起始的index
///   - end: 终点的index
func quickSort(_ numbers:inout [Int], _ start:Int, _ end:Int) {
	
	func partition(_ numbers:inout [Int], _ start:Int, _ end:Int) -> Int {
		if numbers.isEmpty || end <= start || start < 0 {
			fatalError("Invaild Input")
		}
		
		let index = (end - start) >> 1 + start
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
	
	if numbers.isEmpty || end <= start {
		return
	}
	
	let index = partition(&numbers, start, end)
	if index > start {
		quickSort(&numbers, start, index-1)
	}
	if index < end {
		quickSort(&numbers, index+1, end)
	}
}

var nums = [4,5,1,6,2,7,3,8]
quickSort(&nums, 0, nums.count-1)
print(nums)
