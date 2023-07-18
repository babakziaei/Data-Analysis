# AdventureWorks2022 - Constructing a Customer Profile Table from Multiple Data Sources

## Problem Statement
In order to gain valuable insights into customer profiles and purchasing behaviors, it is necessary to analyze the AdventureWorks database. The database contains information about customers, sales orders, and products. However, extracting meaningful information from this extensive dataset can be challenging without appropriate analysis.

## Objectives
The main objectives of this code are:

1. To create a temporary table, `#CustomerProfiles`, that will store relevant customer profile information, including customer ID, name, email promotion status, total amount spent, number of orders, and the most frequently purchased product.
2. To populate the `#CustomerProfiles` table with data extracted from the AdventureWorks database. This involves querying various tables such as `Sales.Customer`, `Person.Person`, `Sales.SalesOrderHeader`, and `Sales.SalesOrderDetail`.

By accomplishing these objectives, we aim to provide a comprehensive overview of customer profiles, including their spending patterns, order frequency, and preferred products. This will facilitate further analysis and decision-making processes related to marketing, customer segmentation, and personalized targeting strategies.
