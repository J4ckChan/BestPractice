/**
	面试题 19: 正则表达式匹配
**/

func match(_ string:String,_ pattern:String) -> Bool {
	guard string.count > 0 && pattern.count > 0 else {
		return false
	}
	
	var str = [Character]()
	for item in string {
		str.append(item)
	}
	
	var pat = [Character]()
	for item in pattern {
		pat.append(item)
	}
	
	return matchCore(&str, &pat, 0, 0)
}

func matchCore(_ string:inout [Character],_ pattern:inout [Character],_ stringIdx:Int,_ patternIdx:Int) -> Bool {
	
	if stringIdx == string.count && patternIdx == pattern.count {
		return true
	}
	
	guard stringIdx < string.count && patternIdx < pattern.count else {
		return false
	}
	
	if patternIdx+1 < pattern.count && pattern[patternIdx+1] == Character("*") {
		if string[stringIdx] == pattern[patternIdx] || pattern[patternIdx] == Character(".") {
			return matchCore(&string, &pattern, stringIdx, patternIdx+2)
				|| matchCore(&string, &pattern, stringIdx+1, patternIdx)
				|| matchCore(&string, &pattern, stringIdx+1, patternIdx+2)
		}else{
			return matchCore(&string, &pattern, stringIdx, patternIdx+2)
		}
	}
	
	if string[stringIdx] == pattern[patternIdx] || pattern[patternIdx] == Character(".") {
		return matchCore(&string, &pattern, stringIdx+1, patternIdx+1)
	}
	
	return false
}