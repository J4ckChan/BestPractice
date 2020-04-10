/**
	面试题 14: 减绳子
**/

//动态规划 - Solution
import Foundation

func maxProductAfterCutting_Solution1(_ length:Int) -> Int {
	guard length > 1 else {
		return 0
	}
	
	if length == 2 {
		return 1
	}else if length == 3 {
		return 2
	}
	
	var products = [0,1,2,3]
	var max = 0
	for i in 4...length {
		max = 0
		for j in 1...i/2 {
			let product = products[i-j]*products[j]
			if product > max {
				max = product
			}
		}
		products.append(max)
	}
	return products[length]
}

//贪婪算法 - Solution
func maxProductAfterCutting_Solution2(_ length:Int) -> Int {
	guard length > 1 else {
		return 0
	}
	
	if length == 2 {
		return 1
	}else if length == 3 {
		return 2
	}
	
	var timeOf3 = length/3
	
	if (length - 3*timeOf3) == 1 {
		timeOf3-=1
	}
	
	let timeOf2 = (length - 3*timeOf3)/2
	
	return Int(pow(3.0, Double(timeOf3)))*Int(pow(2.0, Double(timeOf2)))
}