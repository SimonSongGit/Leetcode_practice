select month,country,
       count(if(type='approved',1,null)) as approved_count,
       sum(if(type='approved',amount,0)) as approved_amount,
       count(if(type='chargeback',1,null)) as chargeback_count,
       sum(if(type='chargeback',amount,0)) as chargeback_amount
from (
      select left(trans_date,7) as month, country,amount,'approved' as type
       from transactions
       where state='approved'
       union all
       select left(c.trans_date,7) as month,country,amount,'chargeback' as type
       from transactions t
            inner join chargebacks_1205 c on t.id=c.trans_id
		) t1
group by t1.month,t1.country
        
        