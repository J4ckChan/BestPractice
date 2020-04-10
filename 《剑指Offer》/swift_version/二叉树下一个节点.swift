/**
	面试题 8: 二叉树下一个节点
**/

public class TreeNode{
	public var val:String
	public var left:TreeNode?
	public var right:TreeNode?
	public var parent:TreeNode?
	public init(_ val:String,parent:TreeNode?){
		self.val = val
		self.left = nil
		self.right = nil
		self.parent = parent
	}
}

let root = TreeNode.init("a", parent: nil)
//left
let b = TreeNode.init("b", parent: root)
root.left = b
let d = TreeNode.init("d", parent: b)
b.left = d
let e = TreeNode.init("e", parent: b)
b.right = e
let h = TreeNode.init("h", parent: e)
e.left = h
let i = TreeNode.init("i", parent: e)
e.right = i
//right
let c = TreeNode.init("c", parent: root)
root.right = c
let f = TreeNode.init("f", parent: c)
c.left = f
let g = TreeNode.init("g", parent: c)
c.right = g

func getInOrderNext(_ node:TreeNode) -> TreeNode? {
	var next : TreeNode? = nil
	if node.right != nil {
		var right = node.right
		while right?.left != nil {
			right = right?.left
		}
		next = right!
	}else if node.parent != nil {
		var current = node
		var parent  = node.parent
		while parent != nil && current === parent!.right {
			current = parent!
			parent = parent!.parent
		}
		next = parent
	}
	return next
}

let next = getInOrderNext(i)
print(next?.val ?? "nil")


