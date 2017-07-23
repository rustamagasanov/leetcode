# Given a string, find the length of the longest substring without repeating characters.
# Examples:
# Given "abcabcbb", the answer is "abc", which the length is 3.
# Given "bbbbb", the answer is "b", with the length of 1.
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 1 if s.size == 1
  longest = ''
  (0..s.size - 1).each do |i|
    curr = s[i]
    (i + 1..s.size - 1).each do |j|
      if curr.chars.include?(s[j])
        break
      else
        curr = s[i..j]
      end
    end
    if curr.size > longest.size
      longest = curr
    end
  end
  longest.size
end

p length_of_longest_substring('abcabcbb') #=> abc 3
p length_of_longest_substring('bbbbb') #=> b 1
p length_of_longest_substring('pwwkew') #=> wke 3
p length_of_longest_substring('au') #=> au 2
p length_of_longest_substring('c') #=> c 1
