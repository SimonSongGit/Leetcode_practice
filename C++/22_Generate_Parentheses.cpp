class Solution {
public:
    vector<string> generateParenthesis(int n) {

        vector<string> ans;
        addpair(ans,"",n,0);
        return ans;
    }

    void addpair(vector<string>& res,string str,int n, int m)
    {
        if(n==0 && m==0)
        {
            res.push_back(str);
        }

        if(n>0){addpair(res,str+'(',n-1,m+1);}
        if(m>0){addpair(res,str+')',n,m-1);}
    }
};
