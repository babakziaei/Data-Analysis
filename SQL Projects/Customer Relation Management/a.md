#Comparative Analysis of Subquery vs CTE Approaches in Excluding Outliers for Monthly Sales and Purchases

## Problem Statement

In the context of our organization, we often need to analyze the sum of sales and purchases on a monthly basis. However, the top 10 orders per month have been identified as outliers and skew our data analysis. Therefore, these outliers need to be removed from our dataset before we can perform meaningful analysis.

## Objectives

1. Remove the top 10 orders per month based on the `TotalDue` field from both sales and purchase data.
2. Calculate the sum of sales and purchases (minus these outliers) on a monthly basis.
3. Display this data side by side by month.
4. Improve the readability of existing SQL queries through the use of Common Table Expressions (CTEs).

## Approach 1: Subqueries 

### Step-by-step process

1. Create two subqueries that generate a dataset from sales and purchases data respectively, including `OrderDate`, `OrderMonth`, `TotalDue`, and an `OrderRank` for each order per month based on the `TotalDue` in descending order.

2. Filter out the top 10 orders per month (where `OrderRank` <= 10) from both datasets.

3. Calculate the sum of `TotalDue` as `TotalSales` and `TotalPurchases` in each filtered dataset grouped by `OrderMonth`.

4. Join the two datasets on `OrderMonth` to display `TotalSales` and `TotalPurchases` side by side.

### Code

```sql
SELECT
A.OrderMonth,
A.TotalSales,
B.TotalPurchases

FROM (
	SELECT
	OrderMonth,
	TotalSales = SUM(TotalDue)
	FROM (
		SELECT 
		   OrderDate
		  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
		  ,TotalDue
		  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
		FROM AdventureWorks2019.Sales.SalesOrderHeader
		) S
	WHERE OrderRank > 10
	GROUP BY OrderMonth
) A

JOIN (
	SELECT
	OrderMonth,
	TotalPurchases = SUM(TotalDue)
	FROM (
		SELECT 
		   OrderDate
		  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
		  ,TotalDue
		  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
		FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
		) P
	WHERE OrderRank > 10
	GROUP BY OrderMonth
) B	ON A.OrderMonth = B.OrderMonth

ORDER BY 1
```

## Approach 2: Common Table Expressions (CTEs) 

### Step-by-step process

1. Create CTEs `Sales` and `Purchases` that generate datasets from sales and purchases data respectively, including `OrderDate`, `OrderMonth`, `TotalDue`, and an `OrderRank` for each order per month based on the `TotalDue` in descending order.

2. Create CTEs `SalesMinusTop10` and `PurchasesMinusTop10` that filter out the top 10 orders per month (where `OrderRank` <= 10) from `Sales` and `Purchases` CTEs respectively.

3. Calculate the sum of `TotalDue` as `TotalSales` and `TotalPurchases` in `SalesMinusTop10` and `PurchasesMinusTop10` CTEs respectively, grouped by `OrderMonth`.

4. Join `SalesMinusTop10` and `PurchasesMinusTop10` on `OrderMonth` to display `TotalSales` and `TotalPurchases` side by side.

### Code

```sql
WITH Sales AS
(
SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM AdventureWorks2019.Sales.SalesOrderHeader
)

,SalesMinusTop10 AS
(
SELECT
OrderMonth,
TotalSales = SUM(TotalDue)
FROM Sales
WHERE OrderRank > 10
GROUP BY OrderMonth
)

,Purchases AS
(
SELECT 
       OrderDate
	  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
      ,TotalDue
	  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
)

,PurchasesMinusTop10 AS
(
SELECT
OrderMonth,
TotalPurchases = SUM(TotalDue)
FROM Purchases
WHERE OrderRank > 10
GROUP BY OrderMonth
)


SELECT
A.OrderMonth,
A.TotalSales,
B.TotalPurchases

FROM SalesMinusTop10 A
	JOIN PurchasesMinusTop10 B
		ON A.OrderMonth = B.OrderMonth

ORDER BY 1
```
