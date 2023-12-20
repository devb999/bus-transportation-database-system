select e.First_Name,e.Last_Name,d.DL_Number,d.DL_Expiry_Dt
from driver d join employee e
on e.emp_id=d.emp_id
where DL_expiry_DT >= '2022-06-01' and DL_expiry_DT <= '2022-09-01';
