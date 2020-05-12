# @param {Integer} n
# @return {Integer}
def find_nth_digit(n)
	digit,idx = 1,0
	while n - idx > 0 do
		idx += count_of_num(digit)
		digit += 1
	end
	
	digit -= 1 #3
	dis = n - (idx - count_of_num(digit)) # 811
	num,right = dis/digit + begin_num(digit),dis%digit # 811/3 + 
	
	if right == 0
		return num%10
	end
	
	num += 1
	reverse = digit - right
	for i in 1..reverse do 
		num /= 10
	end
	
	num%10
end

def count_of_num(dig)
	if dig < 1 then return -1 end
	if dig == 1 then return 9 end
	9 * dig * 10**(dig-1)
end

def begin_num(dig)
	10**(dig-1)-1
end

puts find_nth_digit(1000) #3