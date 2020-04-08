SELECT id,
SUM(case when month='Jan' then revenue end) AS Jan_Revenue,
SUM(case when month='Feb' then revenue end) AS Feb_Revenue,
SUM(case when month='Mar' then revenue end) AS Mar_Revenue,
SUM(case when month='Apr' then revenue end) AS Apr_Revenue,
SUM(case when month='May' then revenue end) AS May_Revenue,
SUM(case when month='Jun' then revenue end) AS Jun_Revenue,
SUM(case when month='Jul' then revenue end) AS Jul_Revenue,
SUM(case when month='Aug' then revenue end) AS Aug_Revenue,
SUM(case when month='Sep' then revenue end) AS Sep_Revenue,
SUM(case when month='Oct' then revenue end) AS Oct_Revenue,
SUM(case when month='Nov' then revenue end) AS Nov_Revenue,
SUM(case when month='Dec' then revenue end) AS Dec_Revenue
FROM Department
GROUP BY id
ORDER BY id