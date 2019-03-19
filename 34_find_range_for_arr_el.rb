# 34. Find First and Last Position of Element in Sorted Array
#
# Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
#
# Your algorithm's runtime complexity must be in the order of O(log n).
#
# If the target is not found in the array, return [-1, -1].
#
# Example 1:
#
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
# Example 2:
#
# Input: nums = [5,7,7,8,8,10], target = 6
# Output: [-1,-1]


def binary_search(nums, target, i = 0)
  return -1 if nums.empty?
  middle = nums.size / 2
  return i + middle if nums[middle] == target
  return -1 if nums.size == 1

  if target > nums[middle]
    binary_search(nums[middle + 1..-1], target, middle + i + 1)
  else
    binary_search(nums[0..middle - 1], target, i)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  pos = binary_search(nums, target)
  return [-1, -1] if pos == -1

  i = pos
  while i > -1 && nums[i] == target
    i -= 1
  end
  left = i + 1


  i = pos
  while i < nums.size && nums[i] == target
    i += 1
  end
  right = i - 1

  [left, right]
end

p search_range([1], 1)
# p search_range([5,7,7,8,8,10], 6)
# p search_range([5,7,7,8,8,10], 5)
# p search_range([5,7,7,8,8,10], 10)
# p search_range([5,7,7,8,8,10], 15)
# p search_range([5,7,7,7,8,8,10], 15)
# p search_range([5,7,7,7,8,8,10], 10)
