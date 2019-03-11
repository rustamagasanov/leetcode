# 28. Implement strStr()
#
# Implement strStr().
#
# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
#
# Example 1:
#
# Input: haystack = "hello", needle = "ll"
# Output: 2
# Example 2:
#
# Input: haystack = "aaaaa", needle = "bba"
# Output: -1

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  # "hello".index('ll') || -1

  return 0 if needle == ''
  str_index = 0
  needle_index = 0
  res = nil

  while haystack[str_index]
    if haystack[str_index] == needle[needle_index]
      res = str_index if needle_index == 0
      needle_index += 1
      return res if needle[needle_index].nil?
    elsif needle_index > 0
      str_index = str_index - needle_index
      needle_index = 0
    end
    str_index += 1
  end

  # haystack.each_char.with_index do |char, i|
  #   if char == needle[needle_index]
  #     p needle_index
  #     res = i if needle_index == 0
  #     needle_index += 1
  #     return res if needle[needle_index].nil?
  #   elsif needle_index > 0
  #     needle_index = 0
  #   end
  # end
  -1
end

p str_str('mississippi', 'issip')
p str_str('hello', 'll')
p str_str('hello', '')
p str_str('aaaaa', 'bba')
