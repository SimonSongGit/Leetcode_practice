/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode *prev = NULL;
    while(head)
        {
          ListNode *tmp;
          tmp = head->next;
          head->next = prev;
          prev = head;
          head = tmp;
        }
        return prev;
    }
};


//recursive method
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
      if(!head || !head->next)
          return head;

      ListNode* node = reverseList(head->next);
      head->next->next = head;
      head->next = NULL;
      return node;


    }
};
