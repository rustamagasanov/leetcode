# 19. Remove Nth Node From End of List
#
# Given a linked list, remove the n-th node from the end of list and return its head.
#
# Example:
#
# Given linked list: 1->2->3->4->5, and n = 2.
#
# After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
#
# Given n will always be valid.
#

class ListNode
  attr_accessor :val, :next
  def initialize(val, nxt = nil)
    @val = val
    @next = nxt
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return head if n < 1

  i = 0
  h = head
  loop do
    h = h.next
    break unless h
    i += 1
  end

  if i - n == -1
    return head.next
  elsif i - n < -1
    return head
  end

  j = 0
  h = head
  loop do
    if j == i - n
      h.next = h.next.next
      break
    else
      h = h.next
    end
    j += 1
  end

  head
end

l = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
p remove_nth_from_end(l, 5)

