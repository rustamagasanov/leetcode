# 20. Valid Parentheses
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# An input string is valid if:
#
# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Note that an empty string is also considered valid.
#
# Example 1:
#
# Input: "()"
# Output: true
# Example 2:
#
# Input: "()[]{}"
# Output: true
# Example 3:
#
# Input: "(]"
# Output: false

# @param {String} s
# @return {Boolean}
def is_valid(s)
  map = {
    '(' => ')', '{' => '}', '[' => ']'
  }
  open_prnts = map.keys
  close_prnts = map.values
  stack = []

  s.each_char do |char|
    if open_prnts.include?(char)
      stack.push(char)
    elsif close_prnts.include?(char) && map.key(char) == stack.last
      stack.pop
    else
      return false
    end
  end

  stack.empty?
end

p is_valid('')
p is_valid('()')
p is_valid('()[]{}')
p is_valid('(]')
p is_valid('([)]')
p is_valid('{[]}')
