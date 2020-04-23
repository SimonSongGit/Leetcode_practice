# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None



#recursive
class Solution:
    def diameterOfBinaryTree(self, root: TreeNode) -> int:
        self.ans = 0

        def dia(t):
            if not t:
                return 0
            left, right = dia(t.left),dia(t.right)
            self.ans = max(self.ans,left+right)
            return 1 + max(left,right)

        dia(root)
        return self.ans


#iterative
class Solution:
    def diameterOfBinaryTree(self, root: TreeNode) -> int:
        maxlen = 0
        depth = {None:-1}
        stack = [(root,0)] if root else 0

        while stack:
            node, visited = stack.pop()
            if not node:
                continue
            if visited == 0:
                stack.extend([(node,1),(node.left,0),(node.right,0)])
            else:
                l = depth[node.left] + 1
                r = depth[node.right] + 1
                depth[node] = max(l,r)
                maxlen = max(maxlen,l+r)
        return maxlen

