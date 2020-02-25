# 43. Multiply Strings
# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  (num1.to_i * num2.to_i).to_s
end
