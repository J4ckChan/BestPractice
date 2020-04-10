/// 61:扑克牌中的顺子
///
/// - Parameter array: 输入只含有五个数字的数组（5张扑克牌）
/// - Returns: 判断是不是连续（顺子）
func isContinuous(_ array:[Int]) -> Bool {
	guard array.count == 5 else { fatalError("input error") }
	
	let sortedArr = array.sorted(by: < )
	var countOf0 = 0
	var isContinuous = true
	var gap = 0
	
	print(sortedArr)
	
	for i in 0..<sortedArr.count {
		let num = sortedArr[i]
		if num == 0 {
			countOf0 += 1
		}else if i > 0 {
			let distance = sortedArr[i] - sortedArr[i-1]
			if distance == 0 {
				isContinuous = false
				break
			}else if distance > 1 {
				gap += distance - 1
			}
		}
	}
	if gap > countOf0 {
		isContinuous = false
	}
	return isContinuous
}


let n = 10000
var array = Array(repeating: [Int](), count: n)
for i in 0..<n {
	for _ in 0..<5 {
		array[i].append(Int(arc4random_uniform(UInt32(14))))
	}
}

for i in 0..<n {
	let res = isContinuous(array[i])
	print("\(res)\n")
}
