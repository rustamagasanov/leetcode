# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# List to String
# @param {ListNode} l
# @return {String}
def list_s(l, res = '')
  list_s(l.next, res) if l.next
  res << l.val.to_s
  # [l.next ? list_s(l.next) : nil, l.val].flatten.join
end

# String to List
# @param {String} s
# @return {List}
def s_list(s, res = nil, root = nil)
  return root if s.size <= 0

  next_node = ListNode.new(s[0])
  if res
    res.next = next_node
    s_list(s[1..-1], res.next, root)
  else
    s_list(s[1..-1], next_node, next_node)
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  res = list_s(l1).to_i + list_s(l2).to_i
  s_list(res.to_s.reverse)
end

# 342: 2 -> 4 -> 3
l1 = ListNode.new(2)
l1.next = ListNode.new(4)
l1.next.next = ListNode.new(3)
# 465: 5 -> 6 -> 4
l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)
# 807: 7 -> 0 -> 8
add_two_numbers(l1, l2)
