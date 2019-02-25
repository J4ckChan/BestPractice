/**
	面试题 18 - 1: 删除链表的节点
**/

public class ListNode {
	public var val:Int
	public var next:ListNode?
	public init(_ val:Int) {
		self.val = val
		self.next = nil
	}
}

func deleteNode(_ head:ListNode,toBeDeleted:ListNode) -> ListNode? {
	if toBeDeleted.next != nil {
		let pNext = toBeDeleted.next!
		toBeDeleted.val = pNext.val
		toBeDeleted.next = pNext.next
	}else if head === toBeDeleted {
		return nil
	}else{
		var node = head
		while node.next != nil {
			if node.next === toBeDeleted {
				node.next = nil
			}else{
				node = node.next!
			}
		}
	}
	return head
}

/**
	面试题 18 - 2: 删除链表中重复的节点
**/
func deleteDuplication(_ head:ListNode) -> ListNode? {
	
	guard head.next != nil else {
		return head
	}
	
	var preNode = ListNode.init(-1)
	preNode.next = head
	var node = head
	while node.next != nil {
		let next = node.next
		var needDelete = false
		if node.val == next!.val {
			needDelete = true
		}
		
		if !needDelete {
			preNode = node
			node = next!
		}else{
			var postNode = next
			while postNode?.next != nil &&  postNode?.val == postNode?.next?.val {
				postNode = postNode?.next
			}
			preNode.next = postNode?.next
			if postNode!.next != nil {
				node = postNode!.next!
			}else{
				break
			}
		}
	}
	return preNode.next
}

