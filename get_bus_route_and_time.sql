SELECT r.Route_ID,b.Stop_Name,b.Stop_Number,b.Stop_Time,r.Start_Location,r.Start_Time,r.End_Location,r.End_Time
FROM route AS r
JOIN bus_stop AS b
ON r.Route_Id = b.Route_Id AND r.Start_Location = b.Start_Location AND r.End_Location = b.End_Location
WHERE b.Stop_Name = 'Botanical Garden' AND b.Stop_Time >= '11:00:00' AND b.Stop_Time <= '15:00:00';
