# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

#recursive
class Solution:
    def maxDepth(self, root: TreeNode) -> int:
        return 1 + max(self.maxDepth(root.left),self.maxDepth(root.right)) if root else 0



#iterative
class Solution:
    def maxDepth(self, root: TreeNode) -> int:
        depth = 0
        level = [root] if root else []
        
        while level:
            depth += 1
            tmp = []
            
            for val in level:
                if val.left:
                    tmp.append(val.left)
                if val.right:
                    tmp.append(val.right)
            
            level = tmp
        return depth
