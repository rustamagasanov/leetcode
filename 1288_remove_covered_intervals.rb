# 1288. Remove Covered Intervals
#
# Given a list of intervals, remove all intervals that are covered by another interval in the list. Interval [a,b) is covered by interval [c,d) if and only if c <= a and b <= d.
# After doing so, return the number of remaining intervals.
#
# Example 1:
#
# Input: intervals = [[1,4],[3,6],[2,8]]
# Output: 2
# Explanation: Interval [3,6] is covered by [2,8], therefore it is removed.

# @param {Integer[][]} intervals
# @return {Integer}
def remove_covered_intervals(intervals)
  (0...intervals.size).each do |i|
    next if intervals[i].nil?
    (i + 1...intervals.size).each do |j|
      next if intervals[j].nil?
      if intervals[j][0] <= intervals[i][0] && intervals[j][1] >= intervals[i][1]
        intervals[i] = nil
        break
      elsif intervals[i][0] <= intervals[j][0] && intervals[i][1] >= intervals[j][1]
        intervals[j] = nil
      end
    end
  end

  intervals.compact.size
end

p remove_covered_intervals([[1, 4], [3, 6], [2, 8]])
p remove_covered_intervals([[0, 10], [1, 6]])
p remove_covered_intervals([[1, 6], [0, 10]])
