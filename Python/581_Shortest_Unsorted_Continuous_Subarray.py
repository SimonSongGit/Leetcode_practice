class Solution:
    def findUnsortedSubarray(self, nums: List[int]) -> int:
        if len(nums)<2:
            return 0
            
        low = 0
        high = len(nums) - 1
        
        while low<len(nums)-1 and nums[low] < nums[low+1]:
            low += 1
        
        while high>0 and nums[high]>nums[high-1]:
            high -= 1
        
        if low>high:
            return 0
        
        tmpMin,tmpMax = min(nums[low:high+1]),max(nums[low:high+1])
        
        while low>0 and tmpMin<nums[low-1]:
            low -= 1
            
        while high<len(nums)-1 and tmpMax>nums[high+1]:
            high += 1
            
        return high-low+1
