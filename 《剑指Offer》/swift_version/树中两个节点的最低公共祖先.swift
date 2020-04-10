class TreeNode {
	var value:Int
	var next:[TreeNode]?
	
	init(_ value:Int){
		self.value = value
	}
}

/// 67:树中两个节点的最低公共祖先
///
/// - Parameters:
///   - root: 树的根节点
///   - left: 两个节点中其中一个节点
///   - right: 两个节点中另一个节点
/// - Returns: 最低公共祖先
func findLastCommonParent(_ root:TreeNode,_ left:TreeNode,_ right:TreeNode) -> TreeNode? {
	var leftArray = [TreeNode]()
	var rightArray = [TreeNode]()
	
	func traverseTree(_ root:TreeNode,_ array:[TreeNode]){
		var nodes = array
		nodes.append(root)
		if let nexts = root.next {
			for node in nexts {
				if node.value == left.value {
					leftArray = nodes
				}else if node.value == right.value {
					rightArray = nodes
				}else{
					traverseTree(node,nodes)
				}
			}
		}
	}
	
	traverseTree(root, [TreeNode]())
	
	(leftArray,rightArray) = (leftArray.reversed(),rightArray.reversed())
	
	let (leftLength, rightLength) = (leftArray.count,rightArray.count)
	let diff = leftLength - rightLength
	
	if diff > 0 {
		leftArray = Array(leftArray[diff..<leftArray.count])
	}else if diff < 0{
		let diff = -diff
		rightArray = Array(rightArray[diff..<rightArray.count])
	}
	
	var (leftIdx, rightIdx) = (0,0)
	var res = TreeNode(-1)
	while leftIdx < leftArray.count && rightIdx < rightArray.count {
		if leftArray[leftIdx].value == rightArray[rightIdx].value {
			res = leftArray[leftIdx]
			break
		}else{
			(leftIdx, rightIdx) = (leftIdx + 1, rightIdx + 1)
		}
	}
	return res
}

let (a,b,c,e,f,g,h,i,k,j) = (TreeNode(0),TreeNode(1),TreeNode(2),
							 TreeNode(4),TreeNode(5),TreeNode(6),
							 TreeNode(7),TreeNode(8),TreeNode(9),
							 TreeNode(10))
a.next = [b,c]
(b.next,c.next) = ([e,f,g],[h])
(e.next,f.next,g.next) = ([i],[k],[j])

let res = findLastCommonParent(a, i, j)
print(res?.value ?? "nil")