# Merge k Sorted Lists
#
# Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
#
# Example:
#
# Input:
# [
#   1->4->5,
#   1->3->4,
#   2->6
# ]
# Output: 1->1->2->3->4->4->5->6

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

def merge_k_lists(lists)
  return [] if lists.empty?
  lists.compact!

  res = r = ListNode.new(nil)

  loop do
    min = 1.0/0.0
    min_list = nil
    index = nil
    lists.each_with_index do |l, i|
      if l && l.val < min
        min = l.val
        min_list = l
        index = i
      end
    end

    break if min_list == nil

    if min_list.next
      lists[index] = min_list.next
    else
      lists.delete_at(index)
    end

    r.val = min

    unless lists.empty?
      r.next = r = ListNode.new(nil)
    end
  end

  res
end

l11 = ListNode.new(1)
l12 = l11.next = ListNode.new(4)
l12.next = ListNode.new(5)

l21 = ListNode.new(1)
l22 = l21.next = ListNode.new(3)
l22.next = ListNode.new(4)

l31 = ListNode.new(2)
l31.next = ListNode.new(6)

p merge_k_lists([l11, l21, l31])
