class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int maxx=nums[0];
        int tmp=0;

        for(int i=0;i<nums.size();i++)
        {
            tmp += nums[i];
            maxx = max(maxx,tmp);
            tmp = max(0,tmp);
        }
        return maxx;
    }
};
