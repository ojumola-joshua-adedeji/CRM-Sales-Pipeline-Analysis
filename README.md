# 📊 CRM Sales Pipeline Analysis (SQL Project)

## 🧠 Overview

This project focuses on cleaning, transforming, and analyzing a CRM sales pipeline dataset using SQL. The goal was to convert messy, inconsistent raw data into a structured dataset suitable for business intelligence and decision-making.

---

# ⭐ STAR Method Breakdown

## 🟡 Situation

The dataset contained approximately 3,000 CRM records with multiple data quality issues:

It includes fields such as:

Organization details
Sales owner
Deal value and probability
Status and pipeline stage
Lead acquisition and close dates

📁 File location:

crm and sales pipelines_c17_english.csv

Note: This dataset is used for educational and portfolio purposes.
Data errors are ---
* Missing and blank values (especially in `stage`)
* Dates stored as text (`VARCHAR`) instead of proper date formats
* Inconsistent formatting (extra spaces, mixed values)
* Misalignment between **status** (customer lifecycle) and **stage** (sales pipeline)
* Incomplete pipeline data preventing accurate funnel analysis

These issues made it difficult to derive reliable insights such as conversion rates, pipeline performance, and revenue forecasting.

---

## 🔵 Task

The objective of this project was to:

* Clean and standardize the dataset
* Convert incorrect data types (especially date fields)
* Reconstruct missing pipeline stages using business logic
* Ensure data consistency and integrity
* Generate key business metrics such as win rate and deal distribution

---

## 🟢 Approach

### 1. Data Cleaning & Preprocessing

* Trimmed unnecessary spaces from text fields (`organization`, `industry`, `stage`)
* Converted empty strings (`''`) into `NULL` values
* Standardized inconsistent entries

---

### 2. Data Type Transformation

* Converted date columns from `VARCHAR` to `DATE` using `STR_TO_DATE`
* Modified table schema to enforce correct data types

---

### 3. Handling Missing Values

* Identified over 2,000 missing `stage` values
* Rebuilt missing pipeline stages using **business rules based on status**

Example logic:

* `New` → Initial Contact
* `Qualified` → Nurturing
* `Disqualified` → Lost
* `Sales Accepted` → Opened
* `Customer` → Won
* `Churned Customer` → Lost

---

### 4. Data Validation

* Verified stage distribution after transformation
* Checked consistency between `stage` and `actual_close_date`
* Ensured no unintended data loss during updates

---

### 5. Performance Optimization

* Improved query performance using MySQL configuration:

  * Increased `innodb_buffer_pool_size`
  * Optimized log buffer size

---

### 6. Analytical Queries

* Computed key KPIs:

  * Total Deals
  * Won Deals
  * Win Rate
* Analyzed stage distribution and pipeline flow
* Validated business logic through grouped aggregations

---

## 🔴 Result

After cleaning and transformation:

* ✅ Eliminated all blank stage values
* ✅ Standardized date fields for accurate time-based analysis
* ✅ Reconstructed a complete and consistent sales pipeline
* ✅ Achieved reliable KPI outputs:

**Key Metrics:**

* Total Deals: ~3000
* Won Deals: 254
* Win Rate: **8.47%**

---

### 📊 Business Impact

* Enabled accurate **sales funnel analysis**
* Improved **data reliability for decision-making**
* Created a dataset ready for **Power BI dashboarding**
* Established a scalable workflow for handling messy CRM data

---

## 🛠️ Tools & Technologies

* MySQL (SQL)
* MySQL Workbench
* Data Cleaning & Transformation Techniques
* CRM Data Modeling Concepts

---

## 🚀 Next Steps

* Build an interactive Power BI dashboard
* Add revenue forecasting using probability weighting
* Perform sales performance analysis by owner and product
* Optimize pipeline conversion strategies

---

## 📌 Key Learning

This project demonstrates the importance of:

* Data cleaning before analysis
* Understanding business context (CRM pipeline logic)
* Structuring messy real-world data into actionable insights

---

## 📂 Project Structure

```bash
crm-sql-project/
│
├── README.md
├── data/
├── sql/
│   ├── cleaning.sql
│   ├── transformation.sql
│   └── analysis.sql
│
├──

```
## 📬 Contact Information

I’m open to opportunities, collaborations, and feedback on this project.

* 📧 Email: [joshuaojumola@gmail.com](mailto:joshuaojumola@gmail.com)
* 🔗 LinkedIn: https://www.linkedin.com/in/ojumola-adedeji
* 💻 GitHub: https://github.com/ojumola-joshua-adedeji



---
