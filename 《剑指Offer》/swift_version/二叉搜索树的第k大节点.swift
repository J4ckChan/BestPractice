class TreeNode <T> {
	var value:T
	var left:TreeNode?
	var right:TreeNode?
	init(_ value:T) {
		self.value = value
	}
}

/// 54:二叉搜索树的第k大节点
///
/// - Parameters:
///   - root: 二叉搜索树
///   - k: 第k
/// - Returns: 第k大节点
func KthNode(_ root:TreeNode<Int>, _ k:Int) -> TreeNode<Int>? {
	
	var array = [TreeNode<Int>]()
	
	func KthNode(_ root:TreeNode<Int>){
		if let left = root.left { KthNode(left) }
		array.append(root)
		if let right = root.right { KthNode(right) }
	}
	
	KthNode(root)
	let count = array.count
	if k <= count { return array[k-1] }
	return nil
}