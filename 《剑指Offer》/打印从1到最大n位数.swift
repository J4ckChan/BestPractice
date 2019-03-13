/**
	面试题 17: 打印从1到最大n位数
**/

func print1ToMaxOfDigits_1(_ n:Int){
	guard n > 0 else {
		return
	}
	
	var number = Array.init(repeating: Character("0"), count: n)
	while !increment(&number) {
		printNum(&number)
	}
}

func increment(_ number:inout [Character]) -> Bool {
	var isOverflow = false
	var isTakeOver = 0
	let count = number.count
	for i in (0..<count).reversed() {
		var nSum = Int(String(number[i]))! + isTakeOver
		if i == count-1 {
			nSum+=1
		}
		
		if nSum >= 10 {
			if i == 0 {
				isOverflow = true
			}else{
				nSum-=10
				isTakeOver = 1
				number[i] = Character(String(nSum))
			}
		}else{
			number[i] = Character(String(nSum))
			break
		}
	}
	return isOverflow
}

func printNum(_ number:inout [Character]){
	var isBegnning0 = true
	var res = ""
	for num in number {
		if isBegnning0 && num != Character("0"){
			isBegnning0 = false
			res+=String(num)
		}else if !isBegnning0{
			res += String(num)
		}
	}
	if res != ""{
		print(res)
	}
}

func print1ToMaxOfDigits_2(_ n:Int){
	guard n > 0 else{
		return
	}
	
	var number = Array.init(repeating: 0, count: n)
	for i in 0..<10 {
		number[0] = i
		print1ToMaxOfDigitsRecursivly(&number, index: 1)
	}
}

func print1ToMaxOfDigitsRecursivly(_ number:inout [Int],index:Int){
	if index == number.count {
		printNum2(&number)
		return
	}
	for i in 0..<10{
		number[index] = i
		print1ToMaxOfDigitsRecursivly(&number, index: index+1)
	}
}

func printNum2(_ nums:inout [Int]){
	var beginning0 = true
	var num = ""
	for item in nums {
		if beginning0 {
			if item != 0 {
				num = String(item)
				beginning0 = false
			}
		}else{
			num+=String(item)
		}
	}
	if num != ""{
		print(num)
	}
}