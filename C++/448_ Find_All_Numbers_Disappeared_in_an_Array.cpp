class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        for(int i=0;i<nums.size();i++)
        {
            int idx = abs(nums[i]);
            nums[idx-1] = -abs(nums[idx-1]);
        }
        vector<int> res;
        for(int j=0;j<nums.size();j++)
        {
            if(nums[j]>0)
            {
                res.push_back(j+1);
            }
        }
        return res;
    }
};
