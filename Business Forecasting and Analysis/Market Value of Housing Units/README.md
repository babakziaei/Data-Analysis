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
