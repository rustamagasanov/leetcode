# Reverse digits of an integer.
#
# Example1: x = 123, return 321
# Example2: x = -123, return -321
#
# Note:
# The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.

# @param {Integer} x
# @return {Integer}
def reverse(x)
  return 0 if x == 0

  if x > 0
    res = x.to_s.reverse.to_i
    res > 2147483647 ? 0 : res
  else
    res = -(x.to_s.reverse[0..-2].to_i)
    res < -2147483648 ? 0 : res
  end
end

p reverse(123)
p reverse(-123)
