# First try
# MAP = { 'IV' => 4, 'IX' => 9, 'XL' => 40, 'XC' => 90, 'CD' => 400, 'CM' => 900, 'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1 }
# @param {String} s
# @return {Integer}
# def roman_to_int(s)
#   res = 0
#   MAP.each do |k,v|
#     res += s.scan(k).size * v
#     s.gsub!(k, '')
#   end
#   res
# end

# Second try
MAP = { 'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1 }
# @param {String} s
# @return {Integer}
def roman_to_int(s)
  res = 0
  (0..s.size - 1).each do |i|
    if MAP[s[i]] < MAP[s[i + 1]].to_i
      res -= MAP[s[i]]
    else
      res += MAP[s[i]]
    end
    # or oneliner
    # res += MAP[s[i]] < MAP[s[i + 1]].to_i ?  -MAP[s[i]] : MAP[s[i]]
  end
  res
end

p "5 -> #{roman_to_int('V')}"
p "1904 -> #{roman_to_int('MCMIV')}"
p "1954 -> #{roman_to_int('MCMLIV')}"
p "1990 -> #{roman_to_int('MCMXC')}"
p "2014 -> #{roman_to_int('MMXIV')}"
