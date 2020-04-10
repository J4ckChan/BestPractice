#!/usr/bin/ruby
def find_repeat_number(nums)
    i = 0
    while i < nums.length do
        a = nums[i]
        if nums[a] != a 
             nums[a],nums[i] = nums[i], nums[a]
        elsif i == a
            i += 1
        elsif i != a
            return a
        end
    end
end