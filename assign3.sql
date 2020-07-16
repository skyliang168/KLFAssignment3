use test1;

select u.name as user_name,a.name as activity_name,count(ua.occurrence) as amount,min(ua.occurrence) as first_occurrence,max(ua.occurrence) as last_occurrence
from ((user_activity as ua
join user as u
on ua.user_id=u.id)
join activity as a
on ua.activity_id=a.id)
where (select month(ua.occurrence)=10)
group by u.name,a.name;

