/// 60:n个骰子的点数
///
/// - Parameter n: 骰子🎲数量

import Foundation

func printProbability(_ n:Int){
	guard n > 0 else { return }
	
	let maxSum = 6*n
	var sumArray = Array(repeating: 0, count: maxSum-n+1)
	
	func probability(_ n:Int, _ sumArray:inout [Int]){
		
		func probabilityHelper(_ sumArray:inout [Int], _ s:Int, _ count:Int, _ n:Int){
			if count == 1 {
				sumArray[s-n] += 1
			}else{
				for i in 1...6 {
					probabilityHelper(&sumArray, s+i, count-1,n)
				}
			}
		}
		
		for i in 1...6 {
			probabilityHelper(&sumArray, i, n, n)
		}
	}
	
	probability(n, &sumArray)
	
	let totalCount = pow(6.0, Double(n))
	for i in 0..<sumArray.count {
		let res = Double(sumArray[i])/totalCount
		let str = String(format: "%.2f", res*100)
		print("\(i+n):\(str)%")
	}
}

printProbability(5)

//递归 → 循环
func printProbility_solution2(_ n:Int){
	guard n > 0 else { return }
	
	let maxValue = 6*n
	var sumArray = Array(repeating: Array(repeating: 0, count: maxValue), count: 2)
	
	for i in 0..<6{
		sumArray[0][i] = 1
	}
	
	for i in 1..<n {
		for j in i..<6*(i+1) {
			let start = (j-6 <= 0) ? 0 : (j-6)
			let end = j-1
			var sum = 0
			for k in start...end {
				sum += sumArray[(i-1)%2][k]
			}
			sumArray[i%2][j] = sum
		}
		sumArray[(i-1)%2] = Array(repeating: 0, count: maxValue)
	}
	
	print(sumArray[(n-1)%2])
	
	let totalCount = pow(6.0, Double(n))
	for i in n-1..<maxValue{
		let res = Double(sumArray[(n-1)%2][i])/totalCount
		let str = String(format: "%.2f", res*100)
		print("\(i+1):\(str)%")
	}
}

printProbility_solution2(5)