/* What is the maximun quantity sold in a transaction? */

SELECT
max(Quantity) as MaxQuantity, count(*) as Transactions
FROM `robust-team-356223.SuperStore_Data.OrderDetails`

/* How many unique products in transactions overall? */

SELECT distinct
ProductID, Quantity
FROM `robust-team-356223.SuperStore_Data.OrderDetails`
WHERE Quantity = 3
order by ProductID asc, Quantity desc
