# 83. Remove Duplicates from Sorted List
# Given a sorted linked list, delete all duplicates such that each element appear only once.
# Example 1:
# Input: 1->1->2
# Output: 1->2
# Example 2:
# Input: 1->1->2->3->3
# Output: 1->2->3

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  return nil unless head.is_a?(ListNode)
  current = head
  loop do
    return head if current.next == nil
    if current.val == current.next.val
      current.next = current.next.next
    else
      current = current.next
    end
  end
end

head = ListNode.new(1)
head.next = n1 = ListNode.new(1)
n1.next = n2 = ListNode.new(2)
n2.next = n3 = ListNode.new(3)
n3.next = ListNode.new(3)
