# 10. Regular Expression Matching
#
# '.' Matches any single character.
# '*' Matches zero or more of the preceding element.
# The matching should cover the entire input string (not partial).
#
# Note:
#
# s could be empty and contains only lowercase letters a-z.
# p could be empty and contains only lowercase letters a-z, and characters like . or *.
# Example 1:
#
# Input:
# s = "aa"
# p = "a"
# Output: false
# Explanation: "a" does not match the entire string "aa".
# Example 2:
#
# Input:
# s = "aa"
# p = "a*"
# Output: true
# Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
# Example 3:
#
# Input:
# s = "ab"
# p = ".*"
# Output: true
# Explanation: ".*" means "zero or more (*) of any character (.)".
# Example 4:
#
# Input:
# s = "aab"
# p = "c*a*b"
# Output: true
# Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
# Example 5:
#
# Input:
# s = "mississippi"
# p = "mis*is*p*."
# Output: false

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  chars = ['.', '*']

  stack = []
  i = 0
  loop do
    break if p[i].nil?
    if p[i] == '.' && p[i + 1] == '*' # .*
      stack << '.*'
      i += 2
    elsif !chars.include?(p[i]) && !chars.include?(p[i + 1]) # x
      stack << p[i]
      i += 1
    elsif !chars.include?(p[i]) && chars.include?(p[i + 1]) # x.  # x*
      stack << "#{p[i]}#{p[i + 1]}"
      i+= 2
    elsif p[i] == '.' # .
      stack << p[i]
      i += 1
    else
      p "exception: #{p[i]}"
      i += 1
    end
  end
  stack
end

p is_match('aa', 'a') # false
p is_match('aa', 'a*') # true
p is_match('ab', '.*') # true
p is_match('aab', 'c*a*b') # true
p is_match('mississippi', 'mis*is*p*.') # false
