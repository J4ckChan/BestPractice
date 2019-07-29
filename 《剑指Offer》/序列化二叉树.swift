class TreeNode {
	var left:TreeNode?
	var right:TreeNode?
	var num:Int
	init(_ num:Int) {
		self.num = num
	}
}

/// 37:序列化二叉树
///
/// - Parameters:
///   - node: 二叉树
///   - result: 输出的序列化
func serialize(_ node:TreeNode?,_ result:inout [String]) {
	if let node = node {
		result.append(String(node.num))
		serialize(node.left, &result)
		serialize(node.right, &result)
	}else{
		result.append("$")
	}
}

/// 反序列化二叉树
///
/// - Parameter input: 发序列化数组
/// - Returns: 二叉树
func deserialize(_ input:inout [String]) -> TreeNode? {
	guard !input.isEmpty else {
		return nil
	}
	
	let numString = input.removeFirst()
	if let num = Int(numString) {
		let head = TreeNode.init(num)
		head.left = deserialize(&input)
		head.right = deserialize(&input)
		return head
	}else{
		return nil
	}
}