

	## SUMMARY OUTPUT								
									
        ### Regression Statistics								
	Multiple R	0.989729888							
	R Square	0.979565251							
	Adjusted R Square	0.979555089							
	Standard Error	0.113240197							
	Observations	30177							
									
	ANOVA								
		df	SS	MS	F	Significance F			
	Regression	15	18540.05587	1236.003725	96387.01892	0			
	Residual	30161	386.7648234	0.012823342					
	Total	30176	18926.8207						
									
		Coefficients	Standard Error	t Stat	P-value	Lower 95%	Upper 95%	Lower 95.0%	Upper 95.0%
β0	Intercept 3.137600258	0.144167363	21.76359606	3.2602E-104	2.855026078	3.420174437	2.855026078	3.420174437
β1	METRO3-1  -0.012059758	0.001641209	-7.348096031	2.06145E-13	-0.015276597	-0.008842919	-0.015276597	-0.008842919
β2	REGION:1 0.015207719	0.001851402	8.214165174	2.22095E-16	0.011578893	0.018836545	0.011578893	0.018836545
β3	LN_LMED	 0.022340632	0.006061005	3.685961915	0.000228239	0.010460805	0.034220459	0.010460805	0.034220459
β4	LN_FMR	 -0.047703442	0.00409304	-11.6547699	2.5327E-31	-0.055725976	-0.039680909	-0.055725976	-0.039680909
β5	LN_IPOV	 0.023439577	0.012979015	1.805959669	0.070934605	-0.001999845	0.048879	-0.001999845	0.048879
β6	BEDRMS	 0.009519827	0.001380729	6.894783065	5.50089E-12	0.006813539	0.012226114	0.006813539	0.012226114
β7	BUILT	 0.000371845	2.69193E-05	13.81331773	2.87009E-43	0.000319082	0.000424608	0.000319082	0.000424608
β8	ROOMS	-0.001016814	0.000640906	-1.586527212	0.112630247	-0.002273016	0.000239388	-0.002273016	0.000239388
β9	PER	-0.005324867	0.002624665	-2.028779761	0.042489494	-0.010469322	-0.000180412	-0.010469322	-0.000180412
β10	LN_ZSMHC -0.015862891	0.001359342	-11.66953536	2.13106E-31	-0.018527259	-0.013198522	-0.018527259	-0.013198522
β11	LN_ZINC2 0.004622948	0.000762158	6.065600367	1.33024E-09	0.003129085	0.00611681	0.003129085	0.00611681
β12	LN_OTHERCOST -0.06605146 0.00092432	-71.45955397	0	       -0.067863165	-0.064239754	-0.067863165	-0.064239754
β13	LN_UTILITY -0.200284182	0.001724581	-116.1349801	0       	-0.203664435	-0.19690393	-0.203664435	-0.19690393
β14	LN_COST06 1.29435182	0.001637823	790.2881948	0	        1.291141618	1.297562022	1.291141618	1.297562022
β15	AGE1	-0.000413134	5.6652E-05	-7.292489638	3.1176E-13	-0.000524174	-0.000302094	-0.000524174	-0.000302094
									
									
Ln(VALUE) = β0 + β1METRO3-1 + β2REGION:1 + β3LN_LMED  + β4LN_FMR + β5LN_IPOV + βBEDRMS + β7BUILT + β8ROOMS + β9PER + β10LN_ZSMHC + β11LN_ZINC2 + β12LN_OTHERCOST + β13LN_UTILITY + β14LN_COST06 + β15AGE1								





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
