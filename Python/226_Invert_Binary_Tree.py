# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None


#recursive
class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        if root:
            root.left,root.right = self.invertTree(root.right),self.invertTree(root.left)
            return root


#iterative
class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        
        stack = [root] if root else []
        
        while stack:
            node = stack.pop()
            if node:
                node.left,node.right = node.right,node.left
                stack.extend([node.left,node.right])
        return root
