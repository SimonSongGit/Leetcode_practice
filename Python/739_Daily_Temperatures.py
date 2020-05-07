class Solution:
    def dailyTemperatures(self, T: List[int]) -> List[int]:
        ans = [0]*len(T)
        stack = []
        
        for i,val in enumerate(T):
            while stack and T[stack[-1]]<val:
                cur = stack.pop()
                ans[cur] = i - cur
            stack.append(i)
        return ans
