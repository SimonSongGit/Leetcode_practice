class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        d = {}
        for val in nums:
            d[val] = d.get(val,0)+1
        
        for key,val in d.items():
            if val>len(nums)//2:
                return key
