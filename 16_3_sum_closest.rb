# 16. 3Sum Closest
# Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
#
# Example:
#
# Given array nums = [-1, 2, 1, -4], and target = 1.
#
# The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

require 'benchmark'

def three_sum_closest(nums, target)
  return [] if nums.size < 3
  nums.sort!
  p nums
  res_sum = nil
  res_proximity = nil
  i = 0
  loop do
    return res_sum if nums[i].nil?
    j = i + 1
    k = nums.size - 1
    while j < k
      p "i=#{i},j=#{j},k=#{k}"
      p "nums[i]=#{nums[i]},nums[j]=#{nums[j]},nums[k]=#{nums[k]}"
      sum = nums[i] + nums[j] + nums[k]
      p "sum=#{sum}"
      puts
      proximity = (target - sum).abs
      return target if proximity == 0

      if res_sum.nil?
        res_sum = sum
        res_proximity = proximity
      elsif proximity < res_proximity
        res_sum = sum
        res_proximity = proximity
      end

      if sum > target
        k -= 1 while nums[k] == nums[k - 1]
        k -= 1
      else
        j += 1 while nums[j] == nums[j + 1]
        j += 1
      end
    end
    i += 1 while nums[i] == nums[i + 1]
    i += 1
  end
end

Benchmark.bm do |x|
  # x.report { p three_sum_closest(
  #   [-1, 0, 1, 2, -1, -4], 20
  # ) }
  # x.report { p three_sum_closest(
  #   [1,1,1,1], 0
  # ) }
  # x.report { p three_sum_closest(
  #   [0,2,1,-3], 1
  # ) }
  # x.report { p three_sum_closest(
  #   [-1, 0, 1, 2, -1, -4], 20
  # ) }
  # x.report { p three_sum_closest(
  #   [0,0,0]
  # ) }
  x.report { p three_sum_closest(
    [0,1,1], 2
  ) }
  # x.report { p three_sum_closest(
  # [13,-14,-10,-4,4,4,0,-14,5,-9,-3,-10,14,7,-3,-4,-3,12,-14,2,-11,-6,0,-7,13,-2,-7,-11,-14,-13,5,14,-12,11,-13,-1,-8,2,0,4,1,4,10,-8,-11,-8,3,1,11,4,-12,8,5,-4,-14,-4,9,-13,-8,2,-11,12,-7,14,0,-5,-2,7,5,5,-3,13,-6,-8,-10,-10,-9,0,6,-12,11,2,11,1,13,4,12,-1,6,-11,-14,2,9,-6,1,-6,-4,14,-13,8,4,-1,6,6,-2,11,11,4,-4,-5,-1,-8,12,-13,1,10,7,-10,-14,-10,-5,-13,0,11], 1
  # ) }
end


