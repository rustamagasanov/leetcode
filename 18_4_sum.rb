# 18. 4Sum
#
# Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
#
# Note:
#
# The solution set must not contain duplicate quadruplets.
#
# Example:
#
# Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
#
# A solution set is:
# [
#   [-1,  0, 0, 1],
#   [-2, -1, 1, 2],
#   [-2,  0, 0, 2]
# ]

require 'benchmark'

def four_sum(nums, target)
  return [] if nums.size < 4
  nums.sort!
  res = []
  a = 0
  # p nums
  loop do
    return res.uniq if nums[a + 3].nil? || nums[a] + nums[a + 1] + nums[a + 2] + nums[a + 3] > target
    b = a + 1
    loop do
      break if nums[b].nil?# || nums[b] + nums[b + 1] + nums[b + 2] + nums[b + 3] > target
      c = b + 1
      d = nums.size - 1
      while c < d
        p "a=#{a},b=#{b},c=#{c},d=#{d}"
        sum = nums[a] + nums[b] + nums[c] + nums[d]
        if sum < target
          c += 1 while nums[c] == nums[c + 1]
          c += 1
        elsif sum > target
          d -= 1 while nums[d] == nums[d - 1]
          d -= 1
        else
          res << [nums[a], nums[b], nums[c], nums[d]]
          c += 1 while nums[c] == nums[c + 1]
          c += 1
          d -= 1 while nums[d] == nums[d - 1]
          d -= 1
        end
      end
      b += 1 while nums[b] == nums[b + 1]
      b += 1
    end
    a += 1 while nums[a] == nums[a + 1]
    a += 1
  end
end

Benchmark.bm do |x|
  # x.report { p four_sum(
  #   [1, 0, -1, 0, -2, 2], 0
  # ) }
  x.report { p four_sum(
    [2, 1, 0, -1], 2
  ) }
end
