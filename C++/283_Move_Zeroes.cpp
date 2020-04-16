class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int tmp = 0;
        for(int i=0;i<nums.size();i++)
        {
            if(nums[i]!=0)
            {
                nums[tmp++] = nums[i];
            }
        }

        for (int j=tmp;j<nums.size();j++)
        {
            nums[j] = 0;
        }

    }
};
