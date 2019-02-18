# ZigZag Conversion
#
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
#
# P   A   H   N
# A P L S I I G
# Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"
#
# Write the code that will take a string and make this conversion given a number of rows:
#
# string convert(string s, int numRows);
# Example 1:
#
# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
# Example 2:
#
# Input: s = "PAYPALISHIRING", numRows = 4
# Output: "PINALSIGYAHRPI"
# Explanation:
#
# P     I    N
# A   L S  I G
# Y A   H R
# P     I

def convert(s, num_rows)
  return '' if s == ''
  return s if num_rows == 1
  strs = []
  num_rows.times { strs << '' }
  strs[0] << s[0]
  bottom = true # going bottom, else going zigzag
  i = 1
  s[1..-1].each_char do |c|
    p strs
    p i
    strs[i] << c
    if bottom
      if i + 1 == num_rows
        bottom = false
        i = num_rows - 2
      else
        i += 1
      end
    else
      if i == 0
        bottom = true
        i = 1
      else
        i -= 1
      end
    end
  end
  strs.join
end

p convert('PAYPALISHIRING', 4)
