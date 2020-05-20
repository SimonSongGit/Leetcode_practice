select sale_date, sum(if(fruit='apples',sold_num,-sold_num)) as diff
from sales
group by sale_date