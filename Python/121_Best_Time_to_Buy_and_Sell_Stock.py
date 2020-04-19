class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_profit,min_price = 0,float('inf')
        
        for val in prices:
            min_price = min(min_price, val)
            max_profit = max(max_profit,val-min_price)
        return max_profit
