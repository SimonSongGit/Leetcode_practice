class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& T) {
        vector<int> res(T.size(),0);
        vector<int> stack;
        for(int i=0;i<T.size();i++)
        {
            while(stack.empty()!=1 && T[stack.back()]<T[i])
            {
                int cur = stack.back();
                res[cur] = i-cur;
                stack.pop_back();
            }
            stack.push_back(i);
        }
        return res;

    }
};
