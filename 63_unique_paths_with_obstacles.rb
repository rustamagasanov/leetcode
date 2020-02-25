# 63. Unique Paths II
# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
# Now consider if some obstacles are added to the grids. How many unique paths would there be?
#
# An obstacle and empty space is marked as 1 and 0 respectively in the grid.
#
# Note: m and n will be at most 100.
#
# Example 1:
#
# Input:
# [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]
# Output: 2
# Explanation:
# There is one obstacle in the middle of the 3x3 grid above.
# There are two ways to reach the bottom-right corner:
# 1. Right -> Right -> Down -> Down
# 2. Down -> Down -> Right -> Right

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  return 1 if obstacle_grid == [[]]
  m = obstacle_grid.size
  return 0 if obstacle_grid.size <= 0
  n = obstacle_grid[0].size

  obstacle_grid[0][0] = (obstacle_grid[0][0] == 0) ? 1 : 0

  (1...n).each do |i|
    if obstacle_grid[0][i - 1] == 0
      obstacle_grid[0][i] = 0
      next
    end
    obstacle_grid[0][i] = (obstacle_grid[0][i] == 0) ? 1 : 0
  end

  (1...m).each do |i|
    if obstacle_grid[i - 1][0] == 0
      obstacle_grid[i][0] = 0
      next
    end
    obstacle_grid[i][0] = (obstacle_grid[i][0] == 0) ? 1 : 0
  end

  (1...m).each do |row|
    (1...n).each do |col|
      if obstacle_grid[row][col] == 1
        obstacle_grid[row][col] = 0
      else
        obstacle_grid[row][col] = obstacle_grid[row][col - 1] + obstacle_grid[row - 1][col]
      end
    end
  end

  print_arr(obstacle_grid)

  obstacle_grid[m - 1][n - 1]
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

p unique_paths_with_obstacles(
  [
    [0]
  ]
)

p unique_paths_with_obstacles(
  [
    [1,0,0,0],
    [0,0,0,0],
    [0,1,0,0]
  ]
)
