# KLFAssignment3
To create the table user:
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
)
To create the table activity:
CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
To create the table user_activity:
CREATE TABLE `user_activity` (
  `activity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `occurrence` datetime DEFAULT NULL,
  KEY `activity_id` (`activity_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `user_activity_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
)
The final statement:
select u.name as user_name,a.name as activity_name,count(ua.occurrence) as amount,min(ua.occurrence) as first_occurrence,max(ua.occurrence) as last_occurrence
from ((user_activity as ua
join user as u
on ua.user_id=u.id)
join activity as a
on ua.activity_id=a.id)
where (select month(ua.occurrence)=10)
group by u.name,a.name;
