# Superstore Sales Analysis

## Business Question
- How much total sales ? 
- How much the order count ? 
- What the average sales per order ?
- How many customer has order in superstore ?
- is the company sales trend is increase by over the year ?
- which region has the most buy our product ?

- which our product has the most sales ?
- what segment is the most sales ?
- who's the company top ordered ? 

- is our shipping already do what it should do, like shipping mode on same day has no shipping duration day which means 0 and so on
- which shipping mode are used to shipping ?

## Dataset
Source: Superstore Sales Dataset
Size: 2.13 MB
link to Kaggle: https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting

## Tools
Python (Pandas), Power BI


## Process
1. Data Cleaning - fill null values from postal code column with fillna function and changing data type for 'order date' and 'ship date' from object to datetime. feature engineering to extract year and month from order date and add new shipping duration column with ship date subtracted by order date for further analysis.
2. EDA - dataset terdiri dari 18 kolom dan 9800 baris, each row contrain one sold product and each order define by order id not row id. Only sales that can be used for analysis and there is no other like revenue, profit and others.  
3. Dashboard - dashboard contain total sales, order count, average order value, count of the customer ordered, yearly sales trend with line chart, sales by region by bar chart, sales by state with a map on Executive Overview at page 1. sales by category and sub-category with bar chart, order count per category and sub-category with bar chart, and average sales per order by sub-category on page category performance. in page customer/segment insight, there are top 10 customer table, sales by segment bar chart, and   sales distribution by segment and region. at shipping and operation page, we have average shipping duration by shipping mode, order count per ship mode, and average order value per ship mode

## key insight
- our sales has significant increase at december
- from 2015 to 2018, our sales has significant increase at 50.73%
- technology has the most sales of all category and top of it is phones
- office supplies has the most ordered item and top of it is binder
- west has the most sales value
- consumer is the most sales value
- shipping mode: standard class avg 5 days, scnd class 3 days, frst class 2 days, same day 0 days which means on the day ordered
- standard class is the most used shipping

## Dashboard Preview
![Executive Overview](superstore_dashboard_page-0001.jpg)
![Category Performance](superstore_dashboard_page-0002.jpg)
![Customer/Segment Insights](superstore_dashboard_page-0003.jpg)
![Shipping/Operations](superstore_dashboard_page-0004.jpg)