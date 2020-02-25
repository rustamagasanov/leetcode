# 62. Unique Paths
# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
#
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
#
# How many possible unique paths are there?
# Note: m and n will be at most 100.
#
# Example 1:
# Input: m = 3, n = 2
# Output: 3
# Explanation:
# From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Right -> Down
# 2. Right -> Down -> Right
# 3. Down -> Right -> Right
#
# Example 2:
# Input: m = 7, n = 3
# Output: 28

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  return 1 if (m == 0 && n > 0) || (n == 0 && m > 0)
  return 0 if m <= 0 && n <= 0
  arr = Array.new(m) { Array.new(n) }
  (0...n).each { |i| arr[0][i] = 1 }
  (0...m).each { |i| arr[i][0] = 1 }
  (1...m).each do |row|
    (1...n).each do |col|
      arr[row][col] = arr[row][col - 1] + arr[row - 1][col]
    end
  end
  # print_arr(arr)
  arr[m - 1][n - 1]
end

def print_arr(arr)
  (0...arr.size).each do |i|
    print "\n" if i != 0
    (0...arr[0].size).each do |j|
      print "#{arr[i][j]} "
    end
  end
  puts
end

p unique_paths(3, 2)
