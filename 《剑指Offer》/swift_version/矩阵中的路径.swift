/**
	面试题 12: 矩阵中的路径
**/

func hasPath(_ matrix:[[String]],_ str:String) -> Bool {
		guard matrix.count > 0 && str.count > 0 else {
				return false
		}
		let rows = matrix.count
		let columns = matrix[0].count
		var visited = Array.init(repeating: Array.init(repeating: false, count: columns), count: rows)
		
		let pathStr = ""
		for i in 0..<rows{
				for j in 0..<columns {
						if hasPathCore(matrix, i, j, pathStr, str, &visited){
								return true
						}
				}
		}
		
		return false
}

func hasPathCore(_ matrix:[[String]],_ row:Int, _ column:Int,_ pathStr:String,_ str:String, _ visited:inout [[Bool]]) -> Bool {
		
		let rows = matrix.count
		let columns = matrix[0].count
		guard row >= 0 && column >= 0
				&& row < rows && column < columns
				&& visited[row][column] == false else {
				return false
		}
		
		var pathStr = pathStr
		pathStr+=matrix[row][column]
		if str.hasPrefix(pathStr) {
				visited[row][column] = true
				if pathStr == str {
						return true
				}else{
						let hasPath = hasPathCore(matrix, row+1, column, pathStr, str, &visited)
								|| hasPathCore(matrix, row-1, column, pathStr, str, &visited)
								|| hasPathCore(matrix, row, column-1, pathStr, str, &visited)
								|| hasPathCore(matrix, row, column+1, pathStr, str, &visited)
						if hasPath {
								return true
						}
				}
		}
		return false
}

let matrix = [["a","b","t","g"],
							["c","f","c","s"],
							["j","d","e","h"]]
print(hasPath(matrix, "abfd"))