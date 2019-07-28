/// 33:二叉搜索树的后续遍历序列
///
/// - Parameter sequence: 二叉搜索树后序遍历的序列数组
/// - Returns: 判断该数组是不是二叉搜索树的后序遍历
func verifySequenceOfBST(_ sequence:[Int]) -> Bool {
	guard !sequence.isEmpty else {
		return false
	}
	
	let rootIndex = sequence.endIndex-1
	let rootValue = sequence.last!
	
	/// start index of right tree
	var rightStartIndex = 0
	for i in 0...rootIndex {
		rightStartIndex = i
		if sequence[rightStartIndex] > rootValue {
			break
		}
	}
	
	for i in rightStartIndex...rootIndex {
		if sequence[i] < rootValue {
			return false
		}
	}
	
	var left = true
	if (rightStartIndex - 1) > 0 {
		let leftTreeArray = Array(sequence[0...(rightStartIndex-1)])
		left = verifySequenceOfBST(leftTreeArray)
	}
	
	var right = true
	if rightStartIndex < rootIndex-1 {
		let rightTreeArray = Array(sequence[rightStartIndex...(rootIndex-1)])
		right = verifySequenceOfBST(rightTreeArray)
	}
	
	return (left && right)
}