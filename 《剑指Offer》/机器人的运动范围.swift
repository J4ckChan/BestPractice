/**
	面试题 13: 机器人的运动范围 
**/

func moveingCount(_ threshold:Int, _ rows:Int,_ columns:Int) -> Int {
	guard threshold > 0 && (rows > 0 || columns > 0) else {
		return 0
	}
	
	var visited = Array.init(repeating: Array.init(repeating: false, count: columns), count: rows)
	return movingCountCore(threshold, rows, columns, 0, 0, &visited)
}

func movingCountCore(_ threshold:Int,_ rows:Int, _ columns:Int,_ row:Int,_ column:Int,_ visited:inout [[Bool]]) -> Int {
	var count = 0
	if check(threshold, rows, columns, row, column, &visited) {
		visited[row][column] = true
		count = movingCountCore(threshold, rows, columns, row+1, column, &visited)
			+ movingCountCore(threshold, rows, columns, row-1, column, &visited)
			+ movingCountCore(threshold, rows, columns, row, column+1, &visited)
			+ movingCountCore(threshold, rows, columns, row, column-1, &visited)
			+ 1
	}
	return count
}

func check(_ threshold:Int,_ rows:Int,_ columns:Int,_ row:Int,_ column:Int,_ visited:inout [[Bool]]) -> Bool {
	guard row >= 0 && column >= 0
		&& row < rows && column < columns
		&& visited[row][column] == false else {
		return false
	}
	
	if getDigitSum(row) + getDigitSum(column) > threshold {
		return false
	}

	return true
}

func getDigitSum(_ num:Int) -> Int{
	var sum = 0
	var num = num
	while num > 0 {
		sum+=num%10
		num/=10
	}
	return sum
}

let res = moveingCount(18, 5, 5)
print(res)
