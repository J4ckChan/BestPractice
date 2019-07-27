/// 31:栈的压入、弹出序列
///
/// - Parameters:
///   - push: 压入的序列
///   - pop: 弹出的序列
/// - Returns: 第二序列是否为压入序列的弹出序列
func isPopOrder(_ push:[Int],_ pop:[Int]) -> Bool {
	var bPossible = false
	guard push.count == pop.count else {
		return bPossible
	}
	
	let length = push.count
	var pushIndex = 0
	var popIndex = 0
	var stack = [Int]()
	
	stack.append(push[pushIndex])
	pushIndex += 1
	while popIndex < length {
		if let last = stack.last {
			if last == pop[popIndex] {
				stack.removeLast()
				popIndex += 1
			}else{
				if pushIndex < length {
					stack.append(push[pushIndex])
					pushIndex += 1
				}else{
					break
				}
			}
		}
	}
	
	if stack.isEmpty {
		bPossible = true
	}
	
	return bPossible
}

let pushArray = [1,2,3,4,5]
let popArray = [4,5,3,2,1]
let popArray1 = [4,3,5,1,2]
let res = isPopOrder(pushArray, popArray)
print(res)