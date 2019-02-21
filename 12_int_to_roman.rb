# 12. Integer to Roman
# Symbol       Value

def int_to_roman(num)
  map = {
    'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
    'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
    'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1
  }

  res = ''
  map.each do |k, v|
    res << k*(num / v)
    num %= v
    break if num == 0
  end
  res
end

p int_to_roman(1994)
p int_to_roman(58)
p int_to_roman(9)
p int_to_roman(4)
p int_to_roman(3)
