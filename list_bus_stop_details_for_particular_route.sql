SELECT r.Route_ID,r.Start_Location,r.End_Location,b.Stop_Name,b.Stop_Number,b.Stop_Time
FROM route AS r
LEFT OUTER JOIN bus_stop as b
ON r.Route_Id = b.Route_Id AND r.Start_Location = b.Start_Location AND r.End_Location = b.End_Location
WHERE r.route_ID = 13
ORDER BY r.start_Location,b.Stop_Number;
