class TreeNode {
	var left:TreeNode?
	var right:TreeNode?
	var num:Int
	init(_ num:Int) {
		self.num = num
	}
	
	func printTree(){
		var stack = [self]
		while !stack.isEmpty {
			var subStack = [TreeNode]()
			var nums = [Int]()
			for node in stack {
				nums.append(node.num)
				if let left = node.left {
					subStack.append(left)
				}
				if let right = node.right {
					subStack.append(right)
				}
			}
			print(nums)
			stack = subStack
		}
	}
}

func MirrorRecursively(_ root:TreeNode) -> TreeNode {
	(root.left,root.right) = (root.right,root.left)
	if var left = root.left {
		left = MirrorRecursively(left)
	}
	if var right = root.right {
		right = MirrorRecursively(right)
	}
	return root
}

let root = TreeNode.init(8)
let a = TreeNode.init(6)
let b = TreeNode.init(10)
let c = TreeNode.init(5)
let d = TreeNode.init(7)
let e = TreeNode.init(9)
let f = TreeNode.init(11)
root.left = a
root.right = b
a.left = c
a.right = d
b.left = e
b.right = f
root.printTree()
let res = MirrorRecursively(root)
res.printTree()