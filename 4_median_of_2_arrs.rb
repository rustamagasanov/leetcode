# There are two sorted arrays nums1 and nums2 of size m and n respectively.
#
# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
#
# Example 1:
# nums1 = [1, 3]
# nums2 = [2]
#
# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]
#
# The median is (2 + 3)/2 = 2.5

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  return 0 if nums1.empty? && nums2.empty?
  res_arr = []
  size = nums1.size + nums2.size

  size.times do
    if nums1.size > 0 && nums2.size > 0
      if nums1[0] <= nums2[0]
        res_arr << nums1.delete_at(0)
      else
        res_arr << nums2.delete_at(0)
      end
    elsif nums1.size > 0
      res_arr << nums1.delete_at(0)
    elsif nums2.size > 0
      res_arr << nums2.delete_at(0)
    end
  end

  res_arr_mid = res_arr.size / 2
  if res_arr.size.odd?
    res_arr[res_arr_mid].to_f
  else
    (res_arr[res_arr_mid - 1] + res_arr[res_arr_mid]) / 2.0
  end
end

p "2 -> #{find_median_sorted_arrays([1, 3], [2])}"
p "2.5 -> #{find_median_sorted_arrays([1, 2], [3, 4])}"
p "3 -> #{find_median_sorted_arrays([1, 3, 5], [2, 4])}"
p "2 -> #{find_median_sorted_arrays([1, 2, 3], [])}"
p "2 -> #{find_median_sorted_arrays([], [1, 2, 3])}"
p "3 -> #{find_median_sorted_arrays([1, 3, 4], [3, 3, 5])}"
p "3 -> #{find_median_sorted_arrays([1, 3, 5], [3, 3, 4])}"
