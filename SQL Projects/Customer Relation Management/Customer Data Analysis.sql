--Customer DATA ANALYSIS
-- Add customer geographical information
ALTER TABLE #CustomerProfiles
ADD Country nvarchar(50), State nvarchar(50), City nvarchar(50);

EXEC tempdb.sys.sp_help N'#CustomerProfiles';

UPDATE #CustomerProfiles
SET Country = (
        SELECT TOP 1 CR.Name
        FROM Person.Address A 
        JOIN Person.StateProvince SP ON A.StateProvinceID = SP.StateProvinceID
        JOIN Person.CountryRegion CR ON SP.CountryRegionCode = CR.CountryRegionCode
        JOIN Sales.Customer C ON C.CustomerID = #CustomerProfiles.CustomerID
        WHERE C.PersonID = A.AddressID
    ),
    State = (
        SELECT TOP 1 SP.Name
        FROM Person.Address A 
        JOIN Person.StateProvince SP ON A.StateProvinceID = SP.StateProvinceID
        JOIN Sales.Customer C ON C.CustomerID = #CustomerProfiles.CustomerID
        WHERE C.PersonID = A.AddressID

    ),
    City = (
        SELECT TOP 1 A.City
        FROM Person.Address A 
        JOIN Sales.Customer C ON C.CustomerID = #CustomerProfiles.CustomerID
        WHERE C.PersonID = A.AddressID );


-- Identify top buyers in each state
;WITH StateTopBuyers AS (
    SELECT 
        State,
        CustomerID,
        RANK() OVER (PARTITION BY State ORDER BY TotalSpent DESC) AS SpenderRank
    FROM #CustomerProfiles
)
SELECT 
    STB.State, 
    STB.CustomerID, 
    STB.SpenderRank
FROM StateTopBuyers STB
WHERE STB.SpenderRank <= 3;

-- Identify preferred product category per state
SELECT
    CP.State,
    PC.Name AS PreferredProductCategory
FROM #CustomerProfiles CP                                       
JOIN (
    SELECT
        SOH.CustomerID,
count( SOH.CustomerID) as NumPurchasePerCategoryForEachCustomerId,
        PS.ProductCategoryID,

        ROW_NUMBER() OVER (PARTITION BY SOH.CustomerID ORDER BY COUNT(*) DESC) AS rn
    FROM Sales.SalesOrderHeader SOH
    JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
    JOIN Production.Product P ON SOD.ProductID = P.ProductID
    JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
    GROUP BY SOH.CustomerID, PS.ProductCategoryID
) PCat ON CP.CustomerID = PCat.CustomerID AND PCat.rn = 1
JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PCat.ProductCategoryID;

-- Spending trend by state
SELECT 
    State,
    SUM(TotalSpent) AS TotalSpend,
    SUM(TotalSpent) / COUNT(DISTINCT CustomerID) AS AvgSpendPerCustomer,
    CASE 
        WHEN SUM(TotalSpent) > LAG(SUM(TotalSpent)) OVER (ORDER BY State) THEN 'Increasing'
        ELSE 'Decreasing'
    END AS SpendTrend
FROM #CustomerProfiles
GROUP BY State;

SELECT 
    State,
    year(orderdate),
    SUM(TotalSpent) AS TotalSpend,
    SUM(TotalSpent) / COUNT(DISTINCT soh.CustomerID) AS AvgSpendPerCustomer,
    CASE 
        WHEN SUM(TotalSpent) > LAG(SUM(TotalSpent)) OVER (PARTITION BY State ORDER BY Year(soh.orderdate)) THEN 'Increasing'
        ELSE 'Decreasing'
    END AS SpendTrend
FROM #CustomerProfiles CP join sales.salesorderheader SOH on CP.customerid=SOH.customerid
GROUP BY State, Year(soh.orderdate);

-- Identify top buyers in each state with additional insights

SELECT 
    t.State, 
    t.CustomerID, 
    t.TotalSpent,
    p.PreferredProduct,
    o.TotalOrders,
    dow.MostActiveDay,
    promo.EmailPromotionPreference
FROM 
(
    SELECT State, CustomerID, TotalSpent, 
        RANK() OVER (PARTITION BY State ORDER BY TotalSpent DESC) as rnk
    FROM #CustomerProfiles
) t
LEFT JOIN 
(
    SELECT 
        cp.CustomerID,
        (SELECT TOP 1 p.Name 
         FROM sales.SalesOrderDetail SOD 
         JOIN Production.Product P ON SOD.ProductID = P.ProductID
         WHERE SOD.SalesOrderID = cp.CustomerID  -- adjusted according to provided schema
         GROUP BY p.Name
         ORDER BY COUNT(*) DESC) as PreferredProduct
    FROM #CustomerProfiles cp
) p ON t.CustomerID = p.CustomerID
LEFT JOIN 
(
    SELECT 
        CustomerID,
        COUNT(*) as TotalOrders
    FROM sales.SalesOrderHeader
    GROUP BY CustomerID
) o ON t.CustomerID = o.CustomerID
LEFT JOIN 
(
    SELECT 
        cp.CustomerID,
        (SELECT TOP 1 DATENAME(WEEKDAY, OrderDate) 
        FROM sales.SalesOrderHeader
        WHERE SalesPersonID = cp.CustomerID  -- adjusted according to provided schema
        GROUP BY DATENAME(WEEKDAY, OrderDate)
        ORDER BY COUNT(*) DESC) as MostActiveDay
    FROM #CustomerProfiles cp
) dow ON t.CustomerID = dow.CustomerID
LEFT JOIN 
(
    SELECT 
        BusinessEntityID AS CustomerID,  -- BusinessEntityID in Person.Person corresponds to CustomerID in sales.Customer
        CASE 
            WHEN EmailPromotion = 1 THEN 'Prefers Email Promotion'
            ELSE 'Does Not Prefer Email Promotion'
        END as EmailPromotionPreference
    FROM Person.Person
) promo ON t.CustomerID = promo.CustomerID
WHERE t.rnk = 1;

