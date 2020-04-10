/**
	面试题 9: 用两个栈实现队列
**/

struct Stack<Element>{
	var items = [Element]()
	mutating func push(_ item : Element){
		items.append(item)
	}
	
	mutating func pop() -> Element? {
		if items.count > 0 {
			return items.removeLast()
		}else{
			return nil
		}
	}
	
	func isEmpty() -> Bool {
		if items.count > 0 {
			return false
		}else{
			return true
		}
	}
	
}

struct Queue <Element>{
	var stackA = Stack<Element>()
	var stackB = Stack<Element>()
	mutating func appendTail(_ item:Element){
		stackA.push(item)
	}
	
	mutating func deleteHead() -> Element?{
		if stackB.isEmpty(){
			while !stackA.isEmpty() {
				let item = stackA.pop()
				stackB.push(item!)
			}
		}
		return stackB.pop()
	}
}