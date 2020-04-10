public class LinkedListNode {
	var next : LinkedListNode?
	var value : Int
	
	public init(_ value:Int) {
		self.value = value
	}
}

/// 52:两个链表的第一个公共节点
///
/// - Parameters:
///   - head1: 链表一
///   - head2: 链表二
/// - Returns: 公共节点
func FindFirstCommonNode(_ head1:LinkedListNode, _ head2:LinkedListNode) -> LinkedListNode? {
	
	func getLength(_ head:LinkedListNode) -> Int {
		var count = 1
		var node:LinkedListNode? = head
		while node!.next != nil {
			count += 1
			node = node!.next
		}
		return count
	}
	
	let length1 = getLength(head1)
	let length2 = getLength(head2)
	var node1:LinkedListNode? = head1
	var node2:LinkedListNode? = head2
	
	var diff = length1 - length2
	if diff > 0 {
		while diff > 0 {
			node1 = node1!.next
			diff -= 1
		}
	}else if diff < 0 {
		while diff < 0 {
			node2 = node2!.next
			diff += 1
		}
	}
	
	while node1 != nil && node2 != nil {
		if node1!.value == node2!.value {
			return node1
		}else{
			(node1,node2) = (node1!.next,node2!.next)
		}
	}
	
	return nil
}

let (a,b,c,d,e,f,g) = (LinkedListNode(1),LinkedListNode(2),
					   LinkedListNode(3),LinkedListNode(6),
					   LinkedListNode(7),LinkedListNode(4),LinkedListNode(5))

(a.next,b.next,c.next,d.next) = (b,c,d,e)
(f.next,g.next) = (g,d)

let res = FindFirstCommonNode(a, f)
print(res?.value ?? "nil")