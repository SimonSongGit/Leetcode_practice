class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        nums_dict = {}
        nums_freq = {}
        
        for val in nums:
            nums_dict[val] = nums_dict.get(val,0)+1
        
        for key,val in nums_dict.items():
            if val not in nums_freq:
                nums_freq[val] = [key]
            else:
                nums_freq[val].append(key)
        
        ans = []
        for i in range(len(nums),0,-1):
            if i in nums_freq:
                for j in nums_freq[i]:
                    if len(ans)==k:
                        break
                    ans.append(j)
        return ans
