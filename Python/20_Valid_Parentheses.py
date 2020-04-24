class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        d = {"]":"[", "}":"{", ")":"("}
        
        for char in s:
            if char in d.values():
                stack.append(char)
            elif char in d and stack!=[]:
                if d[char]!=stack.pop():
                    return False
            else:
                return False
        return stack == []
