# A Regression Model for the Market Value of Housing Units 

In this analysis, we use regression modeling to understand and predict the market value of housing units, using data collected in 2013. The aim is to identify key factors that significantly influence housing prices, and offer insights to homeowners, potential buyers, investors, and policy makers. 

## Model Selection

The model used for this analysis is selected based on a combination of having the best R-Square and reliable P-statistics at the .95 confidence level. The dependent variable in the model (the 'Y' variable) and some of the independent variables (the 'X' variables) have been transformed using natural logarithms. As a result, interpretations of the model coefficients are done either in the semi-log or log-log format.

It's also important to note that, except for 'LN_IPOV' and 'ROOMS', all other p-values are below .05. This indicates that all these coefficients are statistically significant. Given that our R-value is 0.979565, this lends great confidence to the model and its predictive power.

## Coefficients Interpretation

The β coefficients represent the change in the dependent variable resulting from a one unit change in the corresponding independent variable, with all other variables held constant. Here's a breakdown of what each β coefficient represents in our model:

- **β0**: This coefficient represents the model's intercept and does not carry any managerial relevance, as it refers to a situation where all independent variables are zero, which is unlikely to occur in practice.

The following are the interpretations for the other coefficients:

- **β1 (METRO3-1)**: Being located in a 'Central City' area decreases the market value by 1.2%.

- **β2 (REGION:1)**: Being located in the Northeast region increases the market value by 1.5% compared to the West region.

- **β3 (LN_LMED)**: A one percentage increase in area median income leads to a 0.022% increase in market value.

- **β4 (LN_FMR)**: A one percentage increase in fair market rent leads to a 0.47% decrease in market value.

- **β5 (LN_IPOV)**: A one percentage increase in the poverty income threshold leads to a 0.023% increase in market value.

- **β6 (BEDRMS)**: Every additional bedroom corresponds to a 0.95% decrease in market value.

- **β7 (BUILT)**: Every additional year since the housing unit was built leads to a 0.037% increase in market value.

- **β8 (ROOMS)**: Every additional room corresponds to a 0.1% decrease in market value.

- **β9 (PER)**: Every additional person in the household corresponds to a 0.53% decrease in market value.

- **β10 (LN_ZSMHC)**: Every one percentage increase in the monthly housing costs leads to a 0.015% decrease in market value.

- **β11 (LN_ZINC2)**: Every one percentage increase in the annual household income leads to a 0.0046% decrease in market value.

- **β12 (LN_OTHERCOST)**: Every one percentage increase in other monthly costs leads to a 0.066% increase in market value.

- **β13 (LN_UTILITY)**: Every one percentage increase in the monthly utility costs leads to a 0.2% decrease in market value.

- **β14 (LN_COST06)**: Every one percentage increase in the monthly mortgage payments (assuming a 6% interest rate) leads to a 1.294% increase in market value.

- **β15 (AGE1)**: Every additional year in the age of the head of household corresponds to a 0.041% decrease in market value.

## Model Performance

Our model has an R-square and adjusted R-square of approximately 0.99, indicating that it explains about 99% of the variation in housing unit market values. This high R-square value, combined with the statistical significance of most variables, suggests that the model is very reliable.

## Conclusions and Discussion

This analysis shows that variables like the number of rooms, monthly mortgage payments assuming a 6% interest, and the number of persons in the household are among the most influential factors affecting housing market values. The model also reveals some unexpected relationships - for instance, a one percentage increase in the 6% mortgage interest rate actually increases the market value.

This regression model provides a robust tool for understanding and predicting housing market values, offering valuable insights for homeowners, potential buyers, investors, and policy makers. However, it is important to note that while our model is quite reliable, the complex nature of real estate markets means that other factors not included in the model could also play a significant role in determining housing prices.



# A Detailed Regression Analysis on the Market Value of Housing Units

This report covers a comprehensive regression analysis on the market value of housing units using data for the year 2013. The goal is to determine the most influential factors that affect the market value of a housing unit, as well as how these factors interrelate. 

## Model Description

We built a multiple regression model to predict the logarithm of the market value of a housing unit (`Ln(VALUE)`), using 15 different predictor variables: 
- `METRO3-1`: Geographical location, a dummy variable, which is 1 if the housing unit is in the central city area, otherwise 0. 
- `REGION:1`: Another dummy variable for regional classification, which is 1 if the housing unit is in the northeast region of the country, otherwise 0.
- `LN_LMED`: Natural log of area median income.
- `LN_FMR`: Natural log of fair market rent.
- `LN_IPOV`: Natural log of poverty income threshold.
- `BEDRMS`: Number of bedrooms in the housing unit.
- `BUILT`: Year the housing unit was built.
- `ROOMS`: Total number of rooms in the housing unit.
- `PER`: Number of people in the household.
- `LN_ZSMHC`: Natural log of monthly housing costs.
- `LN_ZINC2`: Natural log of annual household income.
- `LN_OTHERCOST`: Natural log of monthly 'other' costs.
- `LN_UTILITY`: Natural log of monthly utility costs.
- `LN_COST06`: Natural log of monthly mortgage payments assuming 6% interest.
- `AGE1`: Age of head of household.

We presented the model equation in this form:

Ln(VALUE) = β0 + β1METRO3-1 + β2REGION:1 + β3LN_LMED  + β4LN_FMR + β5LN_IPOV + βBEDRMS + β7BUILT + β8ROOMS + β9PER + β10LN_ZSMHC + β11LN_ZINC2 + β12LN_OTHERCOST + β13LN_UTILITY + β14LN_COST06 + β15AGE1

## Analysis Results

Here are the results of our analysis:

Multiple R (Correlation Coefficient): 0.989729888
This indicates a strong positive relationship between the predicted (model) and observed (actual) values.

R Square: 0.979565251
This means that 97.96% of the variation in the `Ln(VALUE)` can be explained by our model.

Adjusted R Square: 0.979555089
This is a more accurate version of R square as it adjusts for the number of predictors in the model.

Standard Error: 0.113240197
This measures the average distance that the observed values fall from the regression line.

Observations: 30177
This is the total number of data points used in the model.

F-value: 96387.01892
This tells us that at least one of the predictor variables is statistically significant.

Significance F: 0
This confirms the significance of our model and the validity of our F-value.

## Coefficients Interpretation

Refer to the table to see all the coefficients, their standard errors, t-Statistics, and p-values.

Every coefficient represents the change in the `Ln(VALUE)` for a one unit change in the corresponding predictor, holding other predictors constant. For example, if `METRO3-1` (representing the central city area) increases by 1, `Ln(VALUE)` decreases by 0.012059758 units, holding other variables constant.

The P-value associated with each coefficient tests the null hypothesis that the coefficient is equal to zero (no effect). A low p-value (< 0.05) indicates that you can reject the null hypothesis.

As per our results, all the variables except `LN_IPOV` and `ROOMS` are statistically significant at a 95% confidence level. 

## Conclusion and Discussion

Our model is highly reliable with a 97.96% R-Square, indicating it accurately captures the factors affecting the market value of housing units. This analysis provides insights on the significant impact of geographical location, regional classification, area median income, fair market rent, poverty income threshold, number of bedrooms, year built, total rooms, household size, monthly housing costs, annual household income, 'other' costs, utility costs, mortgage payments, and the age of the head of household on the housing market value.

It's worth noting that the variables `METRO3-1`, `LN_FMR`, `ROOMS`, `PER`, `LN_ZSMHC`, `LN_UTILITY`, and `AGE1` have negative coefficients, indicating that an increase in these variables results in a decrease in the market value, holding other variables constant. On the other hand, the variables `REGION:1`, `LN_LMED`, `LN_IPOV`, `BEDRMS`, `BUILT`, `LN_ZINC2`, `LN_OTHERCOST`, and `LN_COST06` have positive coefficients, indicating that an increase in these variables results in an increase in the market value, holding other variables constant.

Note that our regression model has used logarithmic transformations of many of the 'X' variables, so interpretations of the coefficients will follow semi-log or log-log interpretations.

Please review the detailed interpretations and insights above for a comprehensive understanding of the factors contributing to the market value of housing units.
