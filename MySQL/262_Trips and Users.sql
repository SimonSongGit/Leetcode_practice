select Request_at as Day,round(sum(Status!='completed')/count(*),2) as 'Cancellation Rate'
from trips t
     left join users u1 on t.Client_Id=u1.Users_Id
     left join users u2 on t.Driver_Id=u2.Users_Id
where u1.Banned='No' and u2.Banned='No' and (Request_at BETWEEN '2013-10-01' AND '2013-10-03')
group by Request_at;



select t.Request_at as Day, round(sum(t.Status!='completed')/count(*),2) as 'Cancellation rate'
from Trips t, Users u
where (t.Request_at between '2013-10-01' and '2013-10-03') and
       (t.Client_Id not in (select Users_id from Users where Banned='Yes')) and
       (t.Driver_id not in (select Users_id from Users where Banned='Yes'))
group by t.Request_at



