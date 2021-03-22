SELECT TABLE1.Date,
		TABLE1.Time,
		TABLE1.Invoice_Number,
		SUM(TABLE2.Item_Quantity*TABLE4.Price_Per_Unit*(1-IFNULL(TABLE5.Discount_Percentage,0)/100)) AS Bill_Amount,
		COUNT(DISTINCT(CASE WHEN TABLE5.Discount_Percentage IS NOT NULL THEN TABLE2.Item_No end)) AS No_of_Discounted_Items,
		(CASE WHEN TABLE1.Customer_Loyalty_Card_No IS NOT NULL THEN "Y" else "N" end) AS Is_Loyal_Customer
FROM TABLE1 
INNER JOIN TABLE2
ON (TABLE1.Invoice_Number=TABLE2.Invoice_Number)
INNER JOIN TABLE4
ON (TABLE1.Date=TABLE4.Date)
AND (TABLE2.Item_No=TABLE4.Item_No)
LEFT JOIN TABLE5
ON (TABLE4.Date=TABLE5.Date)
AND TABLE4.Item_No=TABLE5.Item_No)
GROUP BY 1,2,3,6 --Column Name;



--Report 2
SELECT TABLE1.Date,
		COUNT(TABLE1.Invoice_Number) AS Number_Of_Invoices,
		SUM(TABLE2.Item_Quantity) AS Quantity_Sold,
		(CASE WHEN TABLE5.Discount_Percentage IS NOT NULL THEN "Y" else "N" end) AS On_Discount
FROM TABLE1
INNER JOIN TABLE2 
ON (TABLE1.Invoice_Number=TABLE2.Invoice_Number)
LEFT JOIN TABLE5
ON (TABLE1.Date=TABLE5.Date)
AND (TABLE2.Item_No=TABLE5.Item_No)
WHERE TABLE2.Item_No="M898"
GROUP BY 1,4 --column name;


