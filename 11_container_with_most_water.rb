# 11. Container With Most Water
# Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
#
# Note: You may not slant the container and n is at least 2.
# Example:
#
# Input: [1,8,6,2,5,4,8,3,7]
# Output: 49

def max_area(height)
  max = -1.0/0.0
  (0...height.size).each do |i|
    (i + 1...height.size).each do |j|
      vert = [height[i], height[j]].min
      hori = j - i
      max = [vert * hori, max].max
    end
  end
  max
end

p max_area([2,8])
