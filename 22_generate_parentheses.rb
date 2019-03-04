# 22. Generate Parentheses
#
# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
#
# For example, given n = 3, a solution set is:
#
# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]
#

def generate_combination(res, n, line, left, right)
  if line.size == n * 2
    res << line
    return
  end

  if left < n
    generate_combination(res, n, line + '(', left + 1, right)
  end

  if left > right
    generate_combination(res, n, line + ')', left, right + 1)
  end
end

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  return [''] if n < 1
  res = []
  generate_combination(res, n, '', 0, 0)
  res
end

p generate_parenthesis(3)
