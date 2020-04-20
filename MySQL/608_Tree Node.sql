select distinct b.id,(case when a.id is null then 'Leaf'
                      when b.p_id is null then 'Root'
			          else 'Inner'
					  end
		             ) as Type
from tree a
     right join tree b on a.p_id=b.id
order by b.id;



select a.id,
       if(isnull(a.p_id),'Root',if(a.id in (select p_id from tree),'Inner','Leaf')) as Type
from tree a
order by a.id;

select distinct t1.id,if(isnull(t1.p_id),'root',if(t2.p_id,'inner','leaf')) as 'Type'
from tree t1
     left join tree t2 on t1.id=t2.p_id



