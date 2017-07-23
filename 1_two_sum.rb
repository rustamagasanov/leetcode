# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
#
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  size = nums.size

  (0...size).each do |i|
    if nums[i + 1..-1].include?(target - nums[i])
      j = nums.rindex(target - nums[i])
      return [i, j]
    end
  end
  []
end

p "9 [0, 1] -> #{two_sum([2, 7, 11, 15], 9)}"
p "6 [1, 2] -> #{two_sum([3, 2, 4], 6)}"
p "6 [0, 1] -> #{two_sum([3, 3], 6)}"
