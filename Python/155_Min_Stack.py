class MinStack:

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.L = []

    def push(self, x: int) -> None:
        min_ = self.getMin()
        if min_==None or x<min_:
            min_ = x
        self.L.append((x,min_))
        

    def pop(self) -> None:
        self.L.pop()
        

    def top(self) -> int:
        if len(self.L)==0:
            return None
        else:
            return self.L[-1][0]
        

    def getMin(self) -> int:
        if len(self.L)==0:
            return None
        else:
            return self.L[-1][1]
        


# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
