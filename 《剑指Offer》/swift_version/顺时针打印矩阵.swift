/// 29.顺时针打印矩阵
///
/// - Parameter nums: 数组（矩阵）
func printMatrixClockWisely(_ nums:[[Int]]) {
		guard !nums.isEmpty else {
				return
		}
		
		func printMatrixInCircle(_ nums:[[Int]], _ row:Int, _ column:Int, _ start:Int){
				
				let endX = column-start-1
				let endY = row-start-1
				
				for i in start...endX{
						print(nums[start][i])
				}
				
				if endY > start+1 {
						for i in (start+1)...endY{
								print(nums[i][endY])
						}
				}
			 
				if endX > start && endY > start {
						for i in (start..<endX).reversed(){
								print(nums[endY][i])
						}
				}
				
				if endY > (start+1) && endX > start{
						for i in ((start+1)..<endY).reversed() {
								print(nums[i][start])
						}
				}
		}
		
		let (row,column) = (nums.count,nums[0].count)
		var start = 0
		
		while row > 2*start && column > 2*start {
				printMatrixInCircle(nums, row, column, start)
				start += 1
		}
}

let matrix = [[ 1, 2, 3, 4,17],
							[ 5, 6, 7, 8,18],
							[ 9,10,11,12,19],
							[13,14,15,16,20],
							[21,22,23,24,25]]

printMatrixClockWisely(matrix)
