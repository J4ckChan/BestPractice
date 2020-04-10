/**
	面试题 10-1: Fibonacci 
**/

func Fibonacci(_ n:Int) -> Int {
	let nums = [0,1]
	if n < 2 {
		return nums[n]
	}
	
	var (fibNum0,fibNum1) = (0,1)
	for _ in 2..<n{
		(fibNum1,fibNum0) = (fibNum1+fibNum0,fibNum1)
	}
	return fibNum0 + fibNum1
}

/**
	面试题 10-2: 🐸青蛙跳台阶 --> Fibonacci
**/
