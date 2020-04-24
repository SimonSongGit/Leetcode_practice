# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def isPalindrome(self, head: ListNode) -> bool:
        if head is None or head.next is None:
            return True
        
        rev = None
        slow = fast = head
        
        while fast and fast.next:
            fast = fast.next.next
            rev,rev.next,slow = slow,rev,slow.next
        
        if fast:
            slow = slow.next
        
        while rev and rev.val==slow.val:
            rev = rev.next
            slow = slow.next
        return rev is None  
