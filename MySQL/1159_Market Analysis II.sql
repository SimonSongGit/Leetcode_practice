select user_id,if(favorite_brand=item_brand,'yes','no') as 2nd_item_fav_brand
from users u
     left join (
                select o.item_id,if(@id=seller_id,@csum:=@csum+1,@csum:=1) as rank_,@id:=seller_id as seller_id
                from orders o,(select @csum:=0,@id:=0) t1
                order by seller_id,order_date
                ) t2 on u.user_id=t2.seller_id
	 left join items i on t2.item_id=i.item_id
where rank_=2 or isnull(rank_);


SELECT user_id AS seller_id, 
       IF(item_brand = favorite_brand, 'yes', 'no') AS 2nd_item_fav_brand 
FROM   (SELECT user_id, 
               favorite_brand, 
               (SELECT    item_id
                FROM      orders_1159 o 
                WHERE     user_id = o.seller_id 
                ORDER BY order_date desc limit 1) item_id
        FROM   users_1159) u
        LEFT JOIN items_1159 i 
        ON        u.item_id = i.item_id 
