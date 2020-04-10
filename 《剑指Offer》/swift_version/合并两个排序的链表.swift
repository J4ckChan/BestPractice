/**
	面试题 25: 合并两个排序的链表
**/

public class ListNode {
	public var val:Int
	public var next:ListNode?
	public init(_ val:Int) {
		self.val = val
		self.next = nil
	}
}

func merge(_ head1:ListNode?,_ head2:ListNode?) -> ListNode? {
	let head = ListNode.init(-1)
	mergeCore(head, head1, head2)
	return head.next
}

func mergeCore(_ head:ListNode, _ node1:ListNode?, _ node2:ListNode?){
	guard node1 != nil || node2 != nil else {
		return
	}
	
	if node1 != nil && node2 == nil {
		head.next = node1
		return
	}
	
	if node1 == nil && node2 != nil {
		head.next = node2
		return
	}
	
	if node1 != nil && node2 != nil {
		if node1!.val < node2!.val {
			head.next = node1
			mergeCore(head.next!, node1!.next, node2)
		}else{
			head.next = node2
			mergeCore(head.next!, node1, node2!.next)
		}
	}
}