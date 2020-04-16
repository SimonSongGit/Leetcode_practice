class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        
        """
        count = len(nums)-1
        for i in range(len(nums)):
            if nums[i]==0:
                count = i
                break
                
        for j in range(len(nums)):
            if nums[j] != 0 and j>count:
                nums[j],nums[count] = nums[count],nums[j]        
                count += 1
