class Solution:
    def rob(self, nums: List[int]) -> int:
        prev = cur = 0
        
        for val in nums:
            prev,cur = cur,max(prev+val,cur)
        return cur
