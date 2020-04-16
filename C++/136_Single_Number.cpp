class Solution {
public:
    int singleNumber(vector<int>& nums) {
        if(nums.empty()) return 0;
        int tmp = 0;
        for(int i=0;i<nums.size();i++)
        {
            tmp ^= nums[i];
        }
        return tmp;
    }
};
