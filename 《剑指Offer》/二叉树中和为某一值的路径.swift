/// 34:二叉树中和为某一值的路径
///
/// - Parameters:
///   - root: 二叉树
///   - expectedSum: 和值
func findPath(_ root:TreeNode,_ expectedSum:Int) {
	
	func findPathHelper(_ node:TreeNode,_ pathStack:[TreeNode],_ currentSum:Int, _ expectedSum:Int) {
		
		let sum = currentSum + node.num
		var pathStack = pathStack
		pathStack.append(node)
		
		let isLeft = (node.left == nil && node.right == nil)
		if sum == expectedSum && isLeft {
			var printStr = "Path: "
			for (i, node) in pathStack.enumerated() {
				printStr += String(node.num)
				if i != pathStack.count-1 {
					printStr += " → "
				}
			}
			print(printStr)
		}else if isLeft {
			pathStack.removeLast()
		}
		
		if let left = node.left {
			findPathHelper(left, pathStack, sum, expectedSum)
		}
		
		if let right = node.right {
			findPathHelper(right, pathStack, sum, expectedSum)
		}
	}
	
	findPathHelper(root, [], 0, expectedSum)
}