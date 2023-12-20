SELECT p.First_Name,p.Last_Name,c.Card_Number,pr.Purchase_Date,c.Card_Vendor 
FROM passenger p, purchase pr, bus_pass b, card_payment c
WHERE p.Passenger_ID = pr.Passenger_ID AND b.pass_ID = pr.Pass_ID AND c.Card_Number = pr.Card_Number
AND pr.Purchase_Date >= '2021-12-01' AND c.Card_Type = 'Credit' AND b.Pass_Type = 'Monthly';
