/// 59:队列的最大值 -- 滑动窗口的最大值
///
/// - Parameters:
///   - array: 一个数组
///   - winSize: 滑动窗口的大小
/// - Returns: 所有滑动窗口里的最大值
func maxInWindow(_ array:[Int], _ winSize:Int) -> [Int]{
	
	var (index, max) = (0, array.first!)
	var res = [Int]()
	for i in 0..<winSize {
		if array[i] > max {
			(index, max) = (i, array[i])
		}
	}
	res.append(max)
	
	for i in winSize..<array.count {
		let num = array[i]
		if i - index < winSize {
			if num >= max {
				(index, max) = (i, num)
			}
		}else{
			(index, max) = (i, num)
			for j in (i-winSize+1)..<i {
				if array[j] > max {
					(index, max) = (j, array[j])
				}
			}
		}
		res.append(max)
	}
	
	return res
}

let list = [2,3,4,2,6,2,5,1]
print(maxInWindow(list, 3))