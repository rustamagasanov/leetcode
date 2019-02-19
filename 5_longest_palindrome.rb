# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
#
# Example:
#
# Input: "babad"
#
# Output: "bab"
#
# Note: "aba" is also a valid answer.
# Example:
#
# Input: "cbbd"
#
# Output: "bb"

require 'benchmark'

# def palindrome?(s)
#   s == s.reverse
# end
#
# Bruteforce
#
# badad
# 1 ba
# 2 bad
# 3 bada
# 4 badad
# 5 ad
# 6 ada -> longest
# 7 adad
# 8 da -> skip
# 9 dad -> skip
# 10 ad -> skip
# ---> 7 steps
#
# @param {String} s
# @return {String}
# def longest_palindrome(s)
#   return s if s.size == 1
#   longest = ''
#   (0...s.size).each do |i|
#     curr = ''
#     # optimization: start with a string with a size of the current longest
#     (i + longest.size + 1...s.size).each do |j|
#       longest = s[i..j] if palindrome?(s[i..j])
#     end
#   end
#   longest.size > 0 ? longest : s[0]
# end

def expand_to_sides(s, center)
  left, right = center
  longest = ''
  (s.size / 2 + 1).times do
    if left >= 0 && right <= s.size - 1 && s[left] == s[right]
      longest = s[left..right]
      left -= 1
      right += 1
    else
      break
    end
  end
  longest
end

# Smarter way
# 1. Pick a char and 2 chars(odd and even size palindromes, ex aba, abba) as a center
# 2. Expand to the left and right sides; on the edge hit or when sides don't match proceed to 1
def longest_palindrome(s)
  return '' if s == ''
  longest = s[0]
  (0...s.size).each do |i|
    curr_1 = [i, i]
    curr_2 = [i, i + 1]

    res_1 = expand_to_sides(s, curr_1)
    res_2 = expand_to_sides(s, curr_2)

    curr_longest = [res_1, res_2].max_by(&:size)
    longest = curr_longest if longest.size < curr_longest.size
  end
  longest
end

p "bab or aba -> #{longest_palindrome('babad')}"
p "bb -> #{longest_palindrome('cbbd')}"
p "adada -> #{longest_palindrome('babadada')}"
p "ada -> #{longest_palindrome('badad')}"
p "ccc -> #{longest_palindrome('ccc')}"

Benchmark.bm do |x|
  x.report do
    p longest_palindrome("bsnetpqmwhqjunkooftuosgkmkxpmvuehtlpwpktltwlvpdaycnhewdbdrhluyjldecezujgxixehsmjjuyerpllrvzqskizkulqzowzfvqcdsllvgupndbaiuzihcxklvxbodpnrymwobhlvllybdlfabfvnizjpriapuzszdhohfgezayokrivbgbgingspoxsridokhwekawchjdcpylvefubulvxneuizglrjktfcdirwnpqztdpsicslzaeiaibrepifxpxfkczwoumkkuaqkbjhxvasxflmrctponwwenvmtdaqaavubyrzbqjbjxpejmucwunanxwpomqyondyjuzxmzpevxqmbkrwcpdiiph")
  end
  x.report do
    p longest_palindrome("fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg")
  end
end
