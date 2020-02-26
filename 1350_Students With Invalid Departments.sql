select a.id,a.name from students a
where a.department_id not in (select id from departments);


select a.id, a.name from students a
where not exists (select id from departments b
                  where a.department_id=b.id)