class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        d = {}
        for val in nums:
            d[val] = d.get(val,0)+1
        return [key for key,val in d.items() if val==1][0]
