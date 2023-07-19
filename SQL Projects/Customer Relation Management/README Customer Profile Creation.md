# Constructing a Customer Profile Table from Microsoft AdventureWorks database 2022

## Problem Statement
In order to gain valuable insights into customer profiles and purchasing behaviors, it is necessary to analyze the AdventureWorks database. The database contains information about customers, sales orders, and products. However, extracting meaningful information from this extensive dataset can be challenging without appropriate analysis.

## Objectives
The main objectives of this code are:

1. To create a temporary table, `#CustomerProfiles`, that will store relevant customer profile information, including customer ID, name, email promotion status, total amount spent, number of orders, and the most frequently purchased product.
2. To populate the `#CustomerProfiles` table with data extracted from the AdventureWorks database. This involves querying various tables such as `Sales.Customer`, `Person.Person`, `Sales.SalesOrderHeader`, and `Sales.SalesOrderDetail`.

By accomplishing these objectives, we aim to provide a comprehensive overview of customer profiles, including their spending patterns, order frequency, and preferred products. This will facilitate further analysis and decision-making processes related to marketing, customer segmentation, and personalized targeting strategies.

![Capture](https://github.com/babakziaei/Data-Analysis/assets/126654048/6d9ead77-1aa7-4cca-b5fd-40a0581e6dc4)

#### DATASET FROM: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
