# 100. Same Tree
#
# Given two binary trees, write a function to check if they are the same or not.
#
# Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?

  queue1, queue2 = [p], [q]

  loop do
    break true if queue1.empty? && queue2.empty?

    current_node1 = queue1.delete_at(0)
    current_node2 = queue2.delete_at(0)

    return false if current_node1.val != current_node2.val
    return false if (!current_node1.left.nil? && current_node2.left.nil?) || (current_node1.left.nil? && !current_node2.left.nil?)
    return false if (!current_node1.right.nil? && current_node2.right.nil?) || (current_node1.right.nil? && !current_node2.right.nil?)

    queue1 << current_node1.left if !current_node1.left.nil?
    queue1 << current_node1.right if !current_node1.right.nil?

    queue2 << current_node2.left if !current_node2.left.nil?
    queue2 << current_node2.right if !current_node2.right.nil?
  end
end

def bfs_traversal(root)
  queue = [root]

  loop do
    break if queue.empty?
    current_node = queue.delete_at(0)
    p current_node.val
    queue << current_node.left if !current_node.left.nil?
    queue << current_node.right if !current_node.right.nil?
  end
end

root = TreeNode.new(1)

left = root.left = TreeNode.new(2)
right = root.right = TreeNode.new(3)

left.left = TreeNode.new(4)
left.right = TreeNode.new(5)

right.left = TreeNode.new(6)
right.right = TreeNode.new(7)

# p bfs_traversal(root)
