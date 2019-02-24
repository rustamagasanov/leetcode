# 17. Letter Combinations of a Phone Number
#
# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
#
# A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
#
# Example:
#
# Input: "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

def letter_combinations(digits)
  return [] if digits.size <= 0
  map = {
    '2' => 'abc', '3' => 'def', '4' => 'ghi', '5' => 'jkl',
    '6' => 'mno', '7' => 'pqrs', '8' => 'tuv', '9' => 'wxyz'
  }

  size = digits.each_char.reduce(1) { |memo, digit| memo *= map[digit].size }
  res = []
  size.times { res << '' }

  counter = 1
  digits.each_char do |digit|
    cycle = counter
    i = 0
    loop do
      map[digit].each_char do |letter|
        cycle.times do
          res[i] << letter
          i += 1
        end
      end
      break if i >= res.size
    end
    counter = map[digit].size * cycle
  end
  res
end

p letter_combinations('5678')
