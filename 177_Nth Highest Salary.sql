CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
declare M int;
set M = N-1;
  RETURN (
      # Write your MySQL query statement below.
         select Salary from Employee group by Salary order by Salary desc limit M,1
  );
END