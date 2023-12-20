SELECT 	b.Pass_Type, SUM(b.Price) AS 'Annual Revenue Amount'
FROM Bus_Pass AS b
JOIN Purchase AS p
ON b.Pass_Id = p.Pass_Id
WHERE p.Purchase_Date >= '2021-06-01'
GROUP BY b.Pass_Type;
