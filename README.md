# dsa-project

Amazon Product Review Analysis Dashboard
This project is part of an e-commerce analytics case study for RetailTech Insights, where I worked as a Junior Data Analyst. The goal was to extract insights from Amazon product and customer review data to guide product improvement, marketing strategies, and customer engagement.

Authors
⦁	@tobilobasunday

##Documentation

Dataset Overview
Source: Simulated Amazon product data
Records: 1,465 unique products
Fields: 16 columns including product name, category, pricing, ratings, and aggregated user reviews.
Business Questions & Methodology

Below are the key business questions explored in the case study, along with how I approached each one in Excel:

1.	Average Discount % by Category

➤ Pivot Table: category in Rows and the average of discount_percentage in Values.

2.	Number of Products per Category

➤ Pivot Table: category in Rows and count of product_id in Values.

3.	Total Number of Reviews per Category

➤ Pivot Table: category in Rows and sum of rating_count in Values.

4.	Products with Highest Average Ratings

➤ Sorted the main table by rating (converted to numeric). Filtered top 5.

5.	Average Actual vs Discounted Price by Category

➤ Pivot Table showing average of actual_price and discounted_price side-by-side by category.

6.	Products with Highest Number of Reviews

➤ Sorted the main table by rating_count in descending order.

7.	How Many Products Have a Discount of 50% or More?

➤ Created a new column: =IF([@[discount_percentage]]>=0.5, "Yes", "No")

➤ Used COUNTIF() to count "Yes" values.

8.	Distribution of Product Ratings

➤ Pivot Table using rating as Rows and product_id count as Values.

➤ Visualized with a Column Chart.

9.	Total Potential Revenue by Category

➤ Added a calculated column: =[@actual_price] * [@rating_count]

➤ Pivot Table: Sum of this column by category.

10.	Product Count by Price Range Bucket

➤ Added a new column: =IF([@actual_price]<200,"<₹200",IF([@actual_price]<=500,"₹200–₹500",">₹500"))

➤ Pivot Table: Count of products in each bucket.

11.	How Does Rating Relate to Discount?

➤ Created a scatter plot with discount_percentage on X-axis and rating on Y-axis.

➤ Added a trendline to show correlation.

12.	Products with Fewer Than 1,000 Reviews

➤ Used COUNTIF([rating_count], "<1000") to calculate total.

13.	Categories with Highest Discounted Products

➤ Pivot Table: category in Rows, average of discount_percentage in Values.

➤ Sorted from highest to lowest.

14.	Top 5 Products (Rating × Review Count)

➤ Added a new column: =[@rating] * [@rating_count]

➤ Sorted by this new rating_score to identify the top 5.

📊 Dashboard Features

⦁	Built in Microsoft Excel

⦁	Summary KPIs for product count, average discount, total reviews

⦁	Interactive Pivot Tables for slicing and dicing the data

⦁	Dynamic charts: bar, pie, scatter, and column

⦁	Clean and professional layout with branded styling


🖼️ Visual Components Used

Type                                        Used For

KPI Cards                                  Total Products, Avg Rating, Reviews, etc

Bar Chart                                   Discount % by Category

Column Chart                                Review Count & Price Comparisons

Pie Chart                                   Rating Distribution

Scatter Plot                                Rating vs Discount %

Tables                                      Top Products, Products <1000 Reviews


💡 Key Insights

⦁	Most products fall within the ₹200–₹500 range.

⦁	Categories like [fill in top category here] offer steep discounts, attracting high volume.

⦁	Products with higher reviews often command higher prices.

* Only 16% of products are rated below 4.0, indicating overall user satisfaction.


🛠️ Tools Used

Microsoft Excel

Pivot Tables

Calculated Columns

Excel Charts (Bar, Column, Pie, Scatter)

Conditional Formatting

📁 Files Included

File                                                Description

Amazon case study.xlsx                              Raw dataset, cleaned data, and Excel dashboard

README.md                                           Project overview and methodology
