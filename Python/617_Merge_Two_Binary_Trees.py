# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

#recursive method
class Solution:
    def mergeTrees(self, t1: TreeNode, t2: TreeNode) -> TreeNode:
        if t1 and t2:
            root = TreeNode(t1.val+t2.val)
            root.left = self.mergeTrees(t1.left,t2.left)
            root.right = self.mergeTrees(t1.right,t2.right)
            return root
        
        else:
            return t1 or t2


#iterative method
class Solution:
    def mergeTrees(self, t1: TreeNode, t2: TreeNode) -> TreeNode:
        if t1 is None:
            return t2
        
        stack = []
        stack.append((t1,t2))
        
        while stack:
            node = stack.pop()
            if node[1] is None:
                continue
            node[0].val += node[1].val
            
            if node[0].left is None:
                node[0].left = node[1].left
            else:
                stack.append((node[0].left,node[1].left))
                
                
            if node[0].right is None:
                node[0].right = node[1].right
            else:
                stack.append((node[0].right,node[1].right))
        return t1

