select b.book_id,b.name
from books b
     left join orders o on b.book_id=o.book_id and datediff('2019-06-23',dispatch_date)<=365
where datediff('2019-06-23',b.available_from)>30
group by b.book_id
having sum(ifnull(o.quantity,0))<10