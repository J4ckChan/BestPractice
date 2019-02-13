/**
	面试题 7: 二维数组中的查找
**/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

public class TreeNode{
	public var val:Int
	public var left:TreeNode?
	public var right:TreeNode?
	public init(_ val:Int){
		self.val = val
		self.left = nil
		self.right = nil
	}
}

func construct(_ preorder:[Int],_ inorder:[Int]) -> TreeNode?{
	guard preorder.count > 0 && inorder.count > 0 else {
		return nil	
	}
	let rootVal = preorder[0]
	let root = TreeNode.init(rootVal)
	var idx = 0
	for (index,num) in inorder.enumerated() {
		if num == rootVal{
			idx = index
			break
		}
	}
	
	if inorder.count-1 >= idx+1 {
		let preorder = Array(preorder[idx+1...preorder.count-1])
		let inorder = Array(inorder[idx+1...inorder.count-1])
		root.right = construct(preorder,inorder)
	}
	
	if idx >= 1 {
		let preorder = Array(preorder[1...idx])
		let inorder = Array(inorder[0...idx-1])
		root.left = construct(preorder,inorder)
	}
	return root
}

let preorder = [1,2,4,7,3,5,6,8]
let inorder = [4,7,2,1,5,3,8,6]