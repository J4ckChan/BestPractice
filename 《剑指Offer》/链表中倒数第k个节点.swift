/**
	面试题 22: 链表中倒数第k个节点
**/

func findKthToTail(_ head:ListNode, _ kth:UInt) -> ListNode? {
	guard kth > 0 else {
		return nil
	}
	
	var ahead:ListNode = head
	var behind:ListNode? = head
	if kth > 1 {
		for _ in 1...kth-1 {
			if let next = ahead.next {
				ahead = next
			}else{
				return nil
			}
		}
	}
	
	while ahead.next != nil {
		ahead = ahead.next!
		behind = behind!.next
	}
	
	return behind
}