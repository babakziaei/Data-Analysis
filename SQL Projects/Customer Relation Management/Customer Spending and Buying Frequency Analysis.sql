-- Analyzing aggregated customer behavior before cleanup
-- Average Spending and Order Frequency
SELECT
    AVG(TotalSpent) AS AverageSpending,
    AVG(NumOrders) AS AverageOrderFrequency,
    SUM(CASE WHEN SpendingCategory = 'High spender' THEN 1 ELSE 0 END) AS NumHighSpenders,
    SUM(CASE WHEN BuyingFrequencyCategory = 'Frequent buyer' THEN 1 ELSE 0 END) AS NumFrequentBuyers
FROM #CustomerProfiles;

-- Most popular products among high spenders
SELECT
    MostPurchasedProduct,
    COUNT(*) AS NumHighSpenders
FROM #CustomerProfiles
WHERE SpendingCategory = 'High spender'
GROUP BY MostPurchasedProduct
ORDER BY NumHighSpenders DESC;

-- Most popular products among frequent buyers
SELECT
    MostPurchasedProduct,
    COUNT(*) AS NumFrequentBuyers
FROM #CustomerProfiles
WHERE BuyingFrequencyCategory = 'Frequent buyer'
GROUP BY MostPurchasedProduct
ORDER BY NumFrequentBuyers DESC;
