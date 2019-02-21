# 14. Longest Common Prefix
#
# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
#
# Input: ["flower","flow","flight"]
# Output: "fl"
# Example 2:
#
# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

def longest_common_prefix(strs)
  res = ''
  return res if strs.empty?
  (0...strs.min.size).each do |i|
    break if strs.map { |s| s[i] }.uniq.size != 1
    res << strs[0][i]
  end
  res
end

p longest_common_prefix(["flower","flow","flight"])
p longest_common_prefix(["dog","racecar","car"])
