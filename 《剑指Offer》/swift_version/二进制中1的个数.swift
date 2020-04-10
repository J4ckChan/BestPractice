/**
	面试题 15: 二进制中1的个数
**/

func numberOf1(_ n: Int) -> Int {
	var count = 0
	var flag = 1
	while flag > 0 {
		if (n&flag) > 0 {
			count+=1
		}
		flag = flag<<1
	}
	return count
}
