# 24. Swap Nodes in Pairs
#
# Given a linked list, swap every two adjacent nodes and return its head.
# You may not modify the values in the list's nodes, only nodes itself may be changed.
#  Example:
#  Given 1->2->3->4, you should return the list as 2->1->4->3.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  res = head
  loop do
    break if res.nil? || res.next.nil?
    temp = res.val
    res.val = res.next.val
    res.next.val = temp
    res = res.next.next
  end
  head
end

l1 = ListNode.new(1)
l2 = l1.next = ListNode.new(2)
l3 = l2.next = ListNode.new(3)
l4 = l3.next = ListNode.new(4)
l5 = l4.next = ListNode.new(5)

p swap_pairs(l1)
