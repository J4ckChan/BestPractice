/**
	面试题 24: 反转链表
**/

public class ListNode {
	public var val:Int
	public var next:ListNode?
	public init(_ val:Int) {
		self.val = val
		self.next = nil
	}
}

func reverseList(_ head:ListNode) -> ListNode {
	guard head.next != nil else {
		return head
	}
	var reversedHead:ListNode? = nil
	var node:ListNode? = head
	var prevNode:ListNode? = nil
	while node != nil {
		let next = node!.next
		if next == nil {
			reversedHead = node
		}
		node!.next = prevNode
		prevNode = node
		node = next
	}
	
	return reversedHead!
}