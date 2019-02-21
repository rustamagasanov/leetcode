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
  # p "size=#{res.size}"

  counter = nil
  digits.each_char.with_index(0) do |digit, step|
    cycle = counter || 1
    counter = 0
    recount = true
    # cycle_base = (step == 0) ? 0 : map[digits[step - 1]].size
    # cycle = cycle_base ** step
    # p "cycle=#{cycle}"
    i = 0
    loop do
      map[digit].each_char do |letter|
        cycle.times do
          res[i] << letter
          counter += 1 if recount
          i += 1
        end
      end
      recount = false
      break if i >= res.size
    end
  end
  res
end

p letter_combinations('5678')
