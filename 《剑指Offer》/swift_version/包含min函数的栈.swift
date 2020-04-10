/// 包含min函数的栈
struct StackWithMin {
	
	var stack = [Int]()
	var minStack = [Int]()
	var min:Int {
		get {
			if let last = minStack.last {
				return last
			}else{
				return -1
			}
		}
	}
	
	mutating func push(_ num:Int) {
		stack.append(num)
		if let min = minStack.last {
			if min >= num {
				minStack.append(num)
			}else{
				minStack.append(min)
			}
		}else{
			minStack.append(num)
		}
	}
	
	mutating func pop() -> Int{
		if !stack.isEmpty && !minStack.isEmpty {
			let value = stack.removeLast()
			minStack.removeLast()
			return value
		}
		return -1
	}
	
}