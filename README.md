# 🛒 Customer Shopping Behavior Analysis

## 📌 Project Overview
This project analyzes customer shopping behavior using transactional data from 3,900+ purchases across multiple product categories.  
The objective is to extract actionable insights into customer spending patterns, segmentation, product preferences, and subscription behavior to support data-driven business decisions.

---

## 📊 Dataset Summary
- **Total Records:** 3,900
- **Features:** 18 columns  
- **Key Data Includes:**
  - Customer Demographics (Age, Gender, Location, Subscription Status)
  - Purchase Details (Item, Category, Amount, Season, Size, Color)
  - Behavioral Data (Discounts, Purchase Frequency, Ratings, Shipping Type)

- **Data Cleaning:**
  - Handled missing values in `Review Rating` using median imputation
  - Standardized column names (snake_case)
  - Removed redundant columns

---

## 🧹 Data Processing (Python)
- Data loading and exploration using **Pandas**
- Missing value treatment and consistency checks
- Feature engineering:
  - Age group segmentation
  - Purchase frequency calculation
- Integrated cleaned data into **PostgreSQL** for further analysis

---

## 🧠 Business Analysis (SQL)
Performed advanced SQL queries to answer key business questions:

- Revenue comparison by gender
- High-spending customers using discounts
- Top-rated products
- Shipping type impact on spending
- Subscriber vs non-subscriber behavior
- Customer segmentation (New, Returning, Loyal)
- Revenue distribution by age group
- Repeat purchase behavior and subscription trends

---

## 📈 Dashboard (Power BI)
Developed an interactive dashboard to visualize:
- Revenue trends
- Customer segmentation
- Product performance
- Purchase behavior insights

---

## 💡 Key Insights
- Loyal customers contribute significantly to revenue
- Discount usage increases purchase frequency but needs margin control
- Subscribers show higher average spending
- Certain age groups and shipping preferences drive more revenue

---

## 🎯 Business Recommendations
- Introduce loyalty programs to retain repeat customers
- Optimize discount strategies to balance profit and sales
- Promote high-performing products in marketing campaigns
- Encourage subscriptions with exclusive benefits
- Target high-value customer segments

---

## 🛠️ Tech Stack
- **Python (Pandas, NumPy)**
- **SQL (PostgreSQL)**
- **Power BI**
- **Data Analysis & Visualization**

---

## 🚀 Conclusion
This project demonstrates end-to-end data analysis — from data cleaning and transformation to business insights and visualization — enabling strategic decision-making.

---

## 👤 Author
Devanshu
