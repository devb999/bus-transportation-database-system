Select p.First_Name, p.Last_Name, p.Email_ID, p.Phone_no
from passenger p
join address a
on p.passenger_id=a.passenger_id
where a.city='Ahmedabad';
