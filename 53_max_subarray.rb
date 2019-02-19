# 53. Maximum Subarray
# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
#
# Example:
#
# Input: [-2,1,-3,4,-1,2,1,-5,4],
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
# Follow up:
#
# If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

def max_sub_array(nums)
  return nil if nums.empty?
  return nums[0] if nums.size == 1
  max_sum = nums.max
  (0...nums.size).each do |i|
    temp = nums[i]
    (i + 1...nums.size).each do |j|
      temp += nums[j]
      if temp > max_sum
        max_sum = temp
      end
    end
  end
  max_sum
end

p max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
