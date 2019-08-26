/// 47:礼物最大的价值
///
/// - Parameter matrix: 输入mxn的棋盘
/// - Returns: 最多能拿到多少价值的礼物
func getMaxValue(_ matrix:[[Int]]) -> Int {
		guard !matrix.isEmpty else {
				return 0
		}
		
		let (rows,columns) = (matrix.count,matrix[0].count)
		var maxValues = Array.init(repeating: 0, count: columns)
		
		for i in 0..<rows {
				for j in 0..<columns {
						var up = 0
						var left = 0
						
						if i > 0 { up = maxValues[j] }
						if j > 0 { left = maxValues[j-1] }
						
						maxValues[j] = (up > left ? up : left) + matrix[i][j]
				}
		}
		
		let maxValue = maxValues[columns-1]
		
		return maxValue
}

let matrix = [[1,10,3,8],
			  [12,2,9,6],
			  [5,7,4,11],
			  [3,7,16,5]]

let res = getMaxValue(matrix)
print(res)