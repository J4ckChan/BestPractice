class TreeNode {
	var left:TreeNode?
	var right:TreeNode?
	var num:Int
	init(_ num:Int) {
		self.num = num
	}
}

/// 28.对称的二叉树
///
/// - Parameter root: 二叉树的根节点
/// - Returns: 是否为二叉树
func isSymmetrical(_ root:TreeNode) -> Bool {
	
	func isSymmetrical(_ root1:TreeNode?, _ root2:TreeNode?) -> Bool {
		if root1 == nil && root2 == nil {
			return true
		}
		
		if root1 == nil || root2 == nil {
			return false
		}
		
		if root1!.num != root2!.num {
			return false
		}
		
		return isSymmetrical(root1!.left, root2!.right) && 
		isSymmetrical(root1!.right, root2!.left)
	}
	
	return isSymmetrical(root, root)
}