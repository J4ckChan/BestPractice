/// 51:数组中的逆序数
///
/// - Parameter array: 一个数组
/// - Returns: 数组中的逆序数个数
func inversePairs(_ array:[Int]) -> Int {
	
	var count = 0
	
	func mergeSort(_ array:[Int]) -> [Int]{
		guard array.count > 1 else { return array }
		
		let mid = array.count >> 1
		
		let leftArray = mergeSort(Array(array[0..<mid]))
		let rightArray = mergeSort(Array(array[mid..<array.count]))
		
		return merge(leftArray,rightArray)
	}
	
	func merge(_ leftPile:[Int], _ rightPile:[Int]) -> [Int] {
		
		var index = leftPile.count + rightPile.count - 1
		var orderPile = Array(repeating: 0, count: index + 1)
		
		var (i,j) = (leftPile.count - 1,rightPile.count - 1)
		
		while i >= 0 && j >= 0 {
			if leftPile[i] > rightPile[j] {
				count += j + 1
				orderPile[index] = leftPile[i]
				i -= 1
			}else{
				orderPile[index] = rightPile[j]
				j -= 1
			}
			index -= 1
		}
		
		while i >= 0 {
			orderPile[index] = leftPile[i]
			(i,index) = (i-1,index-1)
		}
		
		while j >= 0 {
			orderPile[index] = rightPile[j]
			(j,index) = (j-1,index-1)
		}
		
		return orderPile
	}
	
	guard array.count > 1 else { return 0 }
	
	_ = mergeSort(array)
	
	return count
}

let array = [7,5,6,4]
let res = inversePairs(array)
print(res)