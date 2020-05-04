class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        count = 0
        for k in range(1,n+1):
            if k==1:
                count = n
            else:
                i = 0
                while i+k<n+1:
                    if s[i:i+k] == s[i:i+k][::-1]:
                        count += 1
                    i += 1
        return count
