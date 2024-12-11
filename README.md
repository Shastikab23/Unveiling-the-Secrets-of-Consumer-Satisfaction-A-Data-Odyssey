Overview
This project explores the relationships between passenger demographics, satisfaction levels, and product categories, utilizing the articles.csv dataset. It combines exploratory data analysis, statistical testing, and predictive modeling to provide actionable insights into consumer satisfaction.

Objectives
Examine the correlation between age and satisfaction.
Analyze satisfaction variations across product categories.
Predict satisfaction using a linear regression model based on age.
Methodology
1. Exploratory Data Analysis (EDA)

Age Distribution: Right-skewed, younger passengers dominate.
Satisfaction: Uniformly distributed.
Data Cleaning: Records with missing age and satisfaction values were excluded.
2. Research Questions and Hypotheses

Question 1: Is there a significant correlation between age and satisfaction?
H₀: No correlation.
Hₐ: Significant correlation exists.
Question 2: Do satisfaction levels differ across product categories?
H₀: Levels are consistent.
Hₐ: Levels differ.
Question 3: Can a linear model predict satisfaction from age?
H₀: No significant relationship.
Hₐ: Significant relationship exists.
3. Statistical Testing

Pearson correlation for age and satisfaction.
One-way ANOVA for group differences across product categories.
Linear regression model for predicting satisfaction based on age.
Key Findings
Correlation Between Age and Satisfaction
Result: Moderate positive correlation (0.45, p < 0.001). Older passengers are generally more satisfied.
Group Differences in Satisfaction
Result: Significant differences (F = 5.67, p = 0.02). Certain product categories outperform others.
Linear Regression Model
Equation: 
Satisfaction
=
β
0
+
β
1
×
Age
Satisfaction=β 
0
​	
 +β 
1
​	
 ×Age
Key Metrics:
Age Coefficient (
β
1
β 
1
​	
 ): 0.35
R-squared: 0.20
p-value: < 0.001
Recommendations
Target Younger Demographics: Develop strategies tailored to younger passengers to enhance satisfaction.
Improve Underperforming Products: Investigate and refine categories with lower satisfaction.
Enhance Predictive Models: Incorporate additional demographic variables for more accurate forecasting.
Limitations
Proxy variables for age and satisfaction might limit precision.
Missing demographic data restricts broader analysis.
Conclusion
The analysis reveals actionable insights for improving passenger satisfaction. By targeting younger demographics and addressing product category performance, organizations can foster higher satisfaction levels. Future research can expand on this framework for greater predictive power.
