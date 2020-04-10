/**
	面试题 4: 二维数组中的查找
**/

func findNum(_ matrix:[[Int]], _ number:Int) -> Bool {
	guard matrix.count > 0 else{
		return false
	}
	var row = 0
	var column = matrix[0].count-1
	while row <= matrix.count-1 || column >= 0 {
		let value = matrix[row][column]
		if number > value {
			row+=1
		}else if number < value {
			column-=1
		}else {
			return true
		}
	}
	return false
}

var matrix = [[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]]
print(findNum(matrix,7))
				