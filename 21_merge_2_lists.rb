# 21. Merge Two Sorted Lists
# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
#
# Example:
#
# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return nil if l1.nil? && l2.nil?
  return l1 if l2.nil?
  return l2 if l1.nil?

  vals = [[], []]

  [l1, l2].each_with_index do |l, i|
    loop do
      vals[i] << l.val
      l = l.next
      break if l.nil?
    end
  end

  vals_merged = []
  while vals[0].size > 0 || vals[1].size > 0
    if vals[1].empty? || (vals[0][0] || 1.0/0.0) <= vals[1][0]
      vals_merged << vals[0][0]
      vals[0].shift
    else
      vals_merged << vals[1][0]
      vals[1].shift
    end
  end

  res = ListNode.new(vals_merged.shift)
  r = res
  while vals_merged.size > 0
    r = r.next = ListNode.new(vals_merged.shift)
  end
  res
end

list1 = ListNode.new(1)
list1_2 = list1.next = ListNode.new(2)
list1_3 = list1_2.next = ListNode.new(4)

list2 = ListNode.new(1)
list2_2 = list2.next = ListNode.new(3)
list2_3 = list2_2.next = ListNode.new(4)

p merge_two_lists(list1, list2)
