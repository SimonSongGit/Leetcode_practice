###iteratively reverse a linked list

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        if head == None or head.next == None:
            return head
        
        prev = None
        while head:
            tmp = head.next
            head.next = prev
            prev = head
            head = tmp
        head = prev
        return head
