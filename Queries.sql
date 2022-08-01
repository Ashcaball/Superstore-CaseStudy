/* What is the maximun quantity sold in a transaction? */

SELECT
max(Quantity) as MaxQuantity, count(*) as Transactions
FROM `robust-team-356223.SuperStore_Data.OrderDetails`;

/* How many unique products in transactions overall? */

SELECT distinct
ProductID, Quantity
FROM `robust-team-356223.SuperStore_Data.OrderDetails`
WHERE Quantity = 3
order by ProductID asc, Quantity desc;

/* How many unique properties are there in the 'OrderDetails' table? */

SELECT distinct
PropertyID
FROM `robust-team-356223.SuperStore_Data.OrderDetails`;

-- can also be done this way

SELECT 
count(distinct(PropertyID)) AS UniqueID
FROM `robust-team-356223.SuperStore_Data.OrderDetails`;

/* Which product category has maximum products?  */

SELECT ProductCategory, count(ProductName) AS Products
FROM `robust-team-356223.SuperStore_Data.Products` 
GROUP BY 1
ORDER BY 2 desc;

/* Which state has most stores present? */

SELECT PropertyState ,count(Prop_ID) as Locations
FROM `robust-team-356223.SuperStore_Data.PropertyInfo`
GROUP BY PropertyState
ORDER BY Locations desc; 

/* Top 5 product ID's that did most sales in terms of quantity */

SELECT OrderDetails.ProductID, Products.ProductName, sum(Quantity) AS QuantitySold, sum(Quantity*Price) AS Sales
FROM `robust-team-356223.SuperStore_Data.OrderDetails` AS OrderDetails
JOIN `robust-team-356223.SuperStore_Data.Products` AS Products
ON OrderDetails.ProductID = Products.ProductID
GROUP BY 1, 2
ORDER BY 3 desc
Limit 5;

/* Top 5 stores that did the most sales in terms of quantity */

SELECT OrderDetails.PropertyID, PropertyInfo.PropertyCity, sum(Quantity) AS QuantitySold
FROM `robust-team-356223.SuperStore_Data.OrderDetails` AS OrderDetails
JOIN `robust-team-356223.SuperStore_Data.PropertyInfo` AS PropertyInfo
ON OrderDetails.PropertyID = PropertyInfo.Prop_ID
GROUP BY 1, 2
ORDER BY 3 desc
LIMIT 5;

/* Which city has done the most sales? */

SELECT
 pi.PropertyCity, sum(O.Quantity*P.Price) AS Sales
FROM `robust-team-356223.SuperStore_Data.OrderDetails` AS O
left join `robust-team-356223.SuperStore_Data.Products`  as P 
  on O.ProductID = P.ProductID
left join `robust-team-356223.SuperStore_Data.PropertyInfo` as pi 
  on O.PropertyID = pi.Prop_ID
group by  pi.PropertyCity
order by Sales desc
LIMIT 5;
