# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target, i = 0)
  return 0 if nums.size == 0
  # p "nums:#{nums}, i=#{i}, target=#{target}"

  if nums.size == 1
    if target > nums[0]
      return i + 1
    elsif target < nums[0]
      return (i - 1 < 0) ? 0 : i - 1
    else
      return i
    end
  end
  middle = nums.size / 2

  if target < nums[middle]
    search_insert(nums[0..middle - 1], target, i)
  else
    search_insert(nums[middle..-1], target, i + middle)
  end
end

p search_insert([1,3,5,6], 5)
p search_insert([1,3,5,6], 2)
p search_insert([1,3,5,6], 7)
p search_insert([1,3,5,6], 0)
p search_insert([-8,-7,-4,-3,-1], -5)
