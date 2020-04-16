/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    TreeNode* invertTree(TreeNode* root) {
        TreeNode *tmp;
        if(root)
        {
            tmp = root->left;
            root->left = invertTree(root->right);
            root->right = invertTree(tmp);
            return root;
        }else
        {
            return NULL;
        }

    }
};
