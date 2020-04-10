/**
	面试题 23: 链表中环的入口节点
**/

public class ListNode {
	public var val:Int
	public var next:ListNode?
	public init(_ val:Int) {
		self.val = val
		self.next = nil
	}
}

func meetingNode(_ head:ListNode) -> ListNode? {
	
	var fast = head
	var slow = head
	var isCycle = false
	
	//1.cycle or not
	while fast.next != nil && slow.next != nil {
		if let fastNext = fast.next {
			fast = fastNext
			if let fastNextNext = fastNext.next {
				fast = fastNextNext
			}else{
				return nil
			}
		}else{
			return nil
		}
		
		if let slowNext = slow.next {
			slow = slowNext
		}else{
			return nil
		}
		
		if fast === slow {
			isCycle = true
			break
		}
	}
	
	if !isCycle {
		return nil
	}
	
	//2.cycle node n
	var count = 0
	if fast === slow {
		while fast.next != nil {
			fast = fast.next!
			count+=1
			if fast === slow {
				break
			}
		}
	}
	
	//3.entrance
	fast = head
	slow = head
	for _ in 0..<count{
		fast = fast.next!
	}
	
	while fast !== slow {
		fast = fast.next!
		slow = slow.next!
	}
	
	return fast
}