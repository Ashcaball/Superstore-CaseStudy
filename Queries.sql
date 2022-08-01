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
/* Which state has most stores present? */
/* Top 5 product ID's that did most sales in terms of quantity */
/* Top 5 stores that did the most sales in terms of quantity */
