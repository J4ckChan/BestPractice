/**
	面试题 26: 树的子结构
**/

public class TreeNode {
	public var val:Int
	public var left:TreeNode?
	public var right:TreeNode?
	public init(_ val:Int){
		self.val = val
		self.left = nil
		self.right = nil
	}
}


func hasSubTree(_ root:TreeNode?,_ subTree:TreeNode?) -> Bool {
	var res = false
	
	if root != nil && subTree != nil {
		if root!.val == subTree!.val {
			res = doesTreeHasSubTree(root, subTree)
		}
		
		if !res {
			res = hasSubTree(root!.left, subTree)
		}
		
		if !res {
			res = hasSubTree(root!.right, subTree)
		}
	}

	return res
}


func doesTreeHasSubTree(_ root:TreeNode?,_ subTree:TreeNode?) -> Bool {
	if subTree == nil {
		return true
	}
	
	if root == nil {
		return false
	}
	
	if root!.val != subTree!.val {
		return false
	}
	
	return doesTreeHasSubTree(root!.left, subTree!.left) && doesTreeHasSubTree(root!.right, subTree!.right)
}

let root = TreeNode.init(8)
let a = TreeNode.init(8)
let b = TreeNode.init(7)
root.left = a
root.right = b
let c = TreeNode.init(9)
let d = TreeNode.init(2)
let e = TreeNode.init(4)
let f = TreeNode.init(7)
a.left = c
a.right = d
d.left = e
d.right = f

let subTree = TreeNode.init(8)
let g = TreeNode.init(9)
let i = TreeNode.init(2)
subTree.left = g
subTree.right = i

let res = hasSubTree(root, subTree)
print(res)