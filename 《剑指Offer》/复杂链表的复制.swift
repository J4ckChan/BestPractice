class ComplexListNode {
	var value:Int
	var next:ComplexListNode?
	var silbing:ComplexListNode?
	
	init(_ value:Int) {
		self.value = value
	}
}

/// 35:复杂链表的复制
///
/// - Parameter root: 复杂链表的链头
/// - Returns: 复制的复杂链表
func clone(_ root:inout ComplexListNode) -> ComplexListNode {
	
	func cloneNodes(_ root:inout ComplexListNode){
		var node:ComplexListNode? = root
		while node != nil {
			let cloneNode = ComplexListNode.init(node!.value)
			cloneNode.next = node!.next
			cloneNode.silbing = nil
			
			node!.next = cloneNode
			node = cloneNode.next
		}
	}
	
	func connectSlibingNodes(_ root:inout ComplexListNode){
		var node:ComplexListNode? = root
		while node != nil {
			let cloneNode = node!.next
			if let slibingNode = node!.silbing {
				cloneNode!.silbing = slibingNode.next
			}
			node = cloneNode!.next
		}
	}
	
	func reconnectNodes(_ root:inout ComplexListNode) -> ComplexListNode {
		var node:ComplexListNode? = root
		let clonedHead = root.next!
		var clonedNode = root.next!
		while node != nil {
			node!.next = clonedNode.next
			node = node!.next
			
			if let cloneNext = node?.next {
				clonedNode.next = cloneNext
				clonedNode = cloneNext
			}
		}
		return clonedHead
	}
	
	cloneNodes(&root)
	connectSlibingNodes(&root)
	return reconnectNodes(&root)
}