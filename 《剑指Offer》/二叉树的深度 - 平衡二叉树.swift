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

let a = TreeNode(1)
let b = TreeNode(2)
let c = TreeNode(3)
let d = TreeNode(4)
let e = TreeNode(5)
let f = TreeNode(6)
let g = TreeNode(7)
(a.left,a.right) = (b,c)
(b.left,b.right) = (d,e)
c.right = f
e.right = g

var depth: Int? = 0
let res = isBalanced(a, &depth)
print("\(res),\(depth!)")