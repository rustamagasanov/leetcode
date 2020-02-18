# 1287. Element Appearing More Than 25% In Sorted Array
# Given an integer array sorted in non-decreasing order, there is exactly one integer in the array that occurs more than 25% of the time.
#
# Return that integer.
# Example 1:
# Input: arr = [1,2,2,6,6,6,6,7,10]
# Output: 6

# @param {Integer[]} arr
# @return {Integer}
def find_special_integer(arr)
  arr.each_with_object(Hash.new(0)) { |i, o| o[i] += 1 }.max_by { |k,v| v }[0]
end
