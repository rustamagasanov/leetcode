# 26. Remove Duplicates from Sorted Array
#
# Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
#
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

def remove_duplicates(nums)
  i = 0
  while nums[i + 1]
    if nums[i] == nums[i + 1]
      nums.delete_at(i)
    else
      i += 1
    end
  end
  nums.size
end

p remove_duplicates([1,1,2])
