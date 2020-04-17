class Solution:
    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        for i in range(len(nums)):
            idx = abs(nums[i])
            nums[idx-1] = -abs(nums[idx-1])
        return [i+1 for i in range(len(nums)) if nums[i]>0]
