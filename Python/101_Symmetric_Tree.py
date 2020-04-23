# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None


#recursive method
class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        if not root:
            return True
        return self.isMir(root.left,root.right)

    def isMir(self,left,right):
        if not left and not right:
            return True
        if not left or not right:
            return False
        if left.val == right.val:
            outer = self.isMir(left.left,right.right)
            inner = self.isMir(left.right,right.left)
            return outer and inner
        else:
            return False


#iterative method
class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        if not root:
            return True
        
        stack = [(root.left,root.right)] if root else []
        
        while stack:
            node = stack.pop()
            if not node[0] and not node[1]:
                continue
            if not node[0] or not node[1]:
                return False

            if node[0].val == node[1].val:
                stack.append((node[0].left,node[1].right))
                stack.append((node[0].right,node[1].left))
            else:
                return False
        return stack == []
