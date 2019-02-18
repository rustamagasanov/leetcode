# 8. String to Integer (atoi)
# Implement atoi which converts a string to an integer.
#
# The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
#
# The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
#
# If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
#
# If no valid conversion could be performed, a zero value is returned.
#
# Note:
#
# Only the space character ' ' is considered as whitespace character.
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
# Example 1:
#
# Input: "42"
# Output: 42
#
# Input: "   -42"
# Output: -42
#
# Input: "4193 with words"
# Output: 4193
#
# Input: "words and 987"
# Output: 0

def my_atoi(str)
  str.lstrip!
  digit = ''
  return 0 unless str[0] =~ /[-+\d]/
  digit = str.to_i

  if digit > 2**31 - 1
    2**31 - 1
  elsif digit < -2**31
    -2**31
  else
    digit
  end
end

p my_atoi('42')
p my_atoi('   -42')
p my_atoi('4193 with words')
p my_atoi('words and 987')
p my_atoi('-91283472332')
p my_atoi('+1')
p my_atoi('-00123')

