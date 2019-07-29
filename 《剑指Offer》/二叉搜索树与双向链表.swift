class TreeNode {
	var left:TreeNode?
	var right:TreeNode?
	var num:Int
	init(_ num:Int) {
		self.num = num
	}
}

/// 36:二叉搜索树与双向链表
///
/// - Parameter root: 二叉搜索树
/// - Returns: 双向链表表头
func convert(_ root:inout TreeNode) -> TreeNode {
	
	func convertHelper(_ node: inout TreeNode, _ sortArray:inout [TreeNode]){
		
		if node.left != nil {
			convertHelper(&node.left!, &sortArray)
		}
		
		sortArray.append(node)
		
		if node.right != nil {
			convertHelper(&node.right!, &sortArray)
		}
	}
	
	var sortArray = [TreeNode]()
	convertHelper(&root, &sortArray)
	
	for i in 0..<sortArray.count {
		let next = i+1
		if next < sortArray.count {
			sortArray[i].right = sortArray[next]
			sortArray[next].left = sortArray[i]
		}
	}

	return sortArray.first!
}
