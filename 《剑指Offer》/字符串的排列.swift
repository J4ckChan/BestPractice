/// 38:字符串的排列
///
/// - Parameter string: 输入的字符串
func permutation(_ string:String) {
	
	func permutationWrapper(_ strArray:[String],_ index:Int) {
		if index == strArray.count - 1 {
			print(strArray.joined())
			return
		}
		
		for i in index..<strArray.count {
			var array = strArray
			array.swapAt(i, index)
			permutationWrapper(array, index+1)
		}
	}
	
	guard !string.isEmpty else {
		return
	}
	
	let strArray = string.map{ String($0) }
	permutationWrapper(strArray, 0)
}

let string = "abc"
permutation(string)

/// 38 扩展: 字符的所有组合
///
/// - Parameter stringArray: 输入的字符
func combination(_ stringArray:[String]) {
	
	func combinationWrapper(_ stringArray:[String],_ index:Int,_ string:String) {
		
		if index == stringArray.count {
			if !string.isEmpty {
				print(string)
			}
			return
		}
		
		combinationWrapper(stringArray, index+1, string)
		combinationWrapper(stringArray, index+1, string+stringArray[index])
	}
	
	guard !stringArray.isEmpty else {
		return
	}
	
	combinationWrapper(stringArray, 0, "")
}

let strArray = ["a","b","c"]
combination(strArray)