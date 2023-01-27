This is a sample dataset.

/* What is the maximun quantity sold in a transaction? */

SELECT
max(Quantity) as MaxQuantity, count(*) as Transactions
FROM `robust-team-356223.SuperStore_Data.OrderDetails`;

Result: Quantity of 3 sold in 5000 transactions

/* How many unique products in transactions overall? */

SELECT distinct
ProductID, Quantity
FROM `robust-team-356223.SuperStore_Data.OrderDetails`
WHERE Quantity = 3
order by ProductID asc, Quantity desc;

Result: 50 unique products solds. 3 transaction for each.

/* How many unique properties are there in the 'OrderDetails' table? */

SELECT distinct
PropertyID
FROM `robust-team-356223.SuperStore_Data.OrderDetails`;

Result: 20 unique locations.

-- can also be done this way

SELECT 
count(distinct(PropertyID)) AS UniqueID
FROM `robust-team-356223.SuperStore_Data.OrderDetails`;

/* Which product category has maximum products?  */

SELECT ProductCategory, count(ProductName) AS Products
FROM `robust-team-356223.SuperStore_Data.Products` 
GROUP BY 1
ORDER BY 2 desc;

Result: Product categories include: Furnishings, Public areas, Housekeeping, Maintenance, and Office supplies. Furnishings has most products.  

/* Which state has most stores present? */

SELECT PropertyState ,count(Prop_ID) as Locations
FROM `robust-team-356223.SuperStore_Data.PropertyInfo`
GROUP BY PropertyState
ORDER BY Locations desc; 

Result: Virginia and California are tied with having 2 store locations each.

/* Top 5 product ID's that did most sales in terms of quantity */

SELECT OrderDetails.ProductID, Products.ProductName, sum(Quantity) AS QuantitySold, sum(Quantity*Price) AS Sales
FROM `robust-team-356223.SuperStore_Data.OrderDetails` AS OrderDetails
JOIN `robust-team-356223.SuperStore_Data.Products` AS Products
ON OrderDetails.ProductID = Products.ProductID
GROUP BY 1, 2
ORDER BY 3 desc
Limit 5;

Result: Products with most sales include small area rug, bed sheet (king), mirror, portable drill, luggage cart.

/* Top 5 stores that did the most sales in terms of quantity */

SELECT OrderDetails.PropertyID, PropertyInfo.PropertyCity, sum(Quantity) AS QuantitySold
FROM `robust-team-356223.SuperStore_Data.OrderDetails` AS OrderDetails
JOIN `robust-team-356223.SuperStore_Data.PropertyInfo` AS PropertyInfo
ON OrderDetails.PropertyID = PropertyInfo.Prop_ID
GROUP BY 1, 2
ORDER BY 3 desc
LIMIT 5;

Result: 1. Philadelphia 551, 2. Kansas City 545, 3. Chicago 539, 4. Cincinnati 526, 5. Las Vegas 526

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

Result: 1. Kansas City, 2. Chicago, 3. Los Angeles, 4. New Orleans, 5. Boston

/* Top 5 Products sold at each store */ 

SELECT
 pi.Prop_ID, pi.PropertyCity, P.ProductName, sum(O.Quantity) AS AmountSold
FROM `robust-team-356223.SuperStore_Data.OrderDetails` AS O
left join `robust-team-356223.SuperStore_Data.Products`  as P 
  on O.ProductID = P.ProductID
left join `robust-team-356223.SuperStore_Data.PropertyInfo` as pi 
  on O.PropertyID = pi.Prop_ID
GROUP BY  1, 2, 3
ORDER BY 2, 4 desc
