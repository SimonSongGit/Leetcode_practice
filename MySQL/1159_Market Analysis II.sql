select user_id,if(favorite_brand=item_brand,'yes','no') as 2nd_item_fav_brand
from users u
     left join (
                select o.item_id,if(@id=seller_id,@csum:=@csum+1,@csum:=1) as rank_,@id:=seller_id as seller_id
                from orders o,(select @csum:=0,@id:=0) t1
                order by seller_id,order_date
                ) t2 on u.user_id=t2.seller_id
	 left join items i on t2.item_id=i.item_id
where rank_=2 or isnull(rank_)
