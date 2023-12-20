SELECT b.pass_type as "Quarterly Purchase Details", count(b.Pass_Type) as Count
FROM Bus_Pass as b
JOIN purchase as p
ON b.pass_id = p.pass_id
WHERE p.Purchase_Date >= '2022-03-01'
GROUP BY b.pass_type;
