class TreeNode <T> {
	var value:T
	var left:TreeNode?
	var right:TreeNode?
	init(_ value:T) {
		self.value = value
	}
}

/// 55:二叉树的深度 - 平衡二叉树
///
/// - Parameters:
///   - root: 根节点
///   - depth: 根节点的深度
/// - Returns: 是否是平衡二叉树
func isBalanced(_ root:TreeNode<Int>?) -> Bool{
	
	func isBalanced(_ root:TreeNode<Int>?, _ depth:inout Int?) -> Bool {
		if root == nil {
			depth = 0
			return true
		}
		
		var left:Int?
		var right:Int?
		if isBalanced(root?.left, &left) && isBalanced(root?.right, &right) {
			if let left = left ,let right = right  {
				let diff = left - right
				if diff <= 1 && diff >= -1 {
					depth = 1 + (left > right ? left : right)
					return true
				}
			}
		}
		return false
	}

	var depth : Int?
	return isBalanced(root,&depth)
}


let (a,b,c,d,e,f,g) = (TreeNode(1),
						TreeNode(2),TreeNode(3),
						TreeNode(4),TreeNode(5),
						TreeNode(6),TreeNode(7))
(a.left,a.right) = (b,c)
(b.left,b.right) = (d,e)
c.right = f
e.right = g

let res = isBalanced(a)
print(res)