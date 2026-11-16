# ✈️ Airline Passenger Satisfaction Analysis

An End-to-End Data Analytics Project using Python, MySQL and Power BI.

## 📌 Project Overview

This project focuses on analysing airline passenger satisfaction to understand customer behaviour, passenger demographics, travel patterns and airline service quality.

Using Python, MySQL and Power BI, I performed data cleaning, exploratory data analysis, SQL-based analysis and interactive dashboard development to generate meaningful business insights.

## 📊 About the Dataset

The dataset is sourced from Kaggle and contains airline passenger information, travel details, service ratings and overall satisfaction.

| Dataset Information | Details |
|---|---|
| Total Records | 129,880 |
| Total Columns in Cleaned File | 27 |
| Satisfied Passengers | 56,428 |
| Neutral or Dissatisfied | 73,452 |
| Satisfaction Rate | 43.45% |
| Dissatisfaction Rate | 56.55% |

**Dataset Source:** [Airline Passenger Satisfaction – Kaggle](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction)

## 🎯 Project Objectives

- Analyse overall airline passenger satisfaction.
- Understand passenger demographics and travel behaviour.
- Identify differences in satisfaction across travel classes.
- Evaluate airline service quality and passenger ratings.
- Analyse customer types and travel purposes.
- Identify service areas that may require improvement.
- Develop interactive Power BI dashboards for business insights.

## 🛠️ Tools and Technologies

| Technology | Purpose |
|---|---|
| Python | Data cleaning, manipulation and EDA |
| Pandas | Data processing and analysis |
| NumPy | Numerical operations |
| Matplotlib | Data visualisation |
| Seaborn | Statistical visualisation |
| Jupyter Notebook | Python development |
| MySQL | SQL querying and analysis |
| Power BI | Interactive dashboards and reporting |

## 🔍 Project Workflow

### 1. Python – Data Cleaning and Exploratory Data Analysis

I used Python and Jupyter Notebook to explore, clean and prepare the airline passenger dataset.

**Activities performed:**
- Imported the dataset using Pandas.
- Explored dataset structure using `head()`, `info()` and `describe()`.
- Checked missing values and duplicate records.
- Analysed data types and unique values.
- Performed data cleaning and preprocessing.
- Created age groups for passenger segmentation.
- Analysed numerical and categorical variables.
- Performed exploratory data analysis using visualisations.

### 2. MySQL – SQL Data Analysis

I used MySQL to perform structured queries and analyse passenger information.

**SQL concepts covered:**
- Database and table creation
- SELECT, WHERE and ORDER BY
- Aggregate functions
- GROUP BY and HAVING
- CASE statements
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Views

**Business analysis:**
- Passenger distribution by gender and customer type.
- Satisfaction analysis by travel class.
- Passenger behaviour by travel purpose.
- Flight distance and delay analysis.
- Passenger ranking and group comparisons.

### 3. Power BI – Interactive Dashboard Development

I developed three interactive dashboards to present the findings through KPIs, charts, tables and slicers.

#### Dashboard 1: Airline Passenger Satisfaction – Executive Overview

**Key Performance Indicators:**
- Total Passengers
- Satisfied Passengers
- Dissatisfied Passengers
- Satisfaction Rate

**Visualisations:**
- Passenger Satisfaction Distribution
- Passenger Satisfaction by Travel Class
- Passenger Satisfaction Summary Table

**Interactive Filters:**
- Gender
- Type of Travel
- Customer Type
- Class

![Airline Passenger Satisfaction Dashboard](PowerBI/Airline%20Passenger%20Satisfaction%20-%20Dashboard%203.png)

#### Dashboard 2: Passenger Demographics & Travel Analysis

**Key Performance Indicators:**
- Total Passengers
- Average Age
- Average Flight Distance
- Loyal Customers
- Business Travellers

**Visualisations:**
- Passenger Distribution by Age Group
- Passenger Distribution by Customer Type
- Passenger Distribution by Gender
- Travel Type Distribution by Class

**Interactive Filters:**
- Class
- Age Group
- Customer Type

![Passenger Demographics Dashboard](PowerBI/Passenger%20Demographics%20%26%20Travel%20Analysis%20-%20Dashboard%202.png)

#### Dashboard 3: Airline Service Quality Analysis

**Key Performance Indicators:**
- Average Wi-Fi Rating
- Average Seat Comfort
- Average Online Boarding
- Average Food and Drink Rating
- Average Entertainment Rating

**Visualisations:**
- Passenger Satisfaction Funnel
- Service Satisfaction Distribution
- Average Wi-Fi Service Rating by Satisfaction and Class
- Seat Comfort and Satisfaction Comparison

**Interactive Filters:**
- Gender
- Class
- Customer Type
- Travel Purpose

![Airline Service Quality Dashboard](PowerBI/Airline%20Service%20Quality%20Analysis%20-%20Dashboard%201.png)


<img width="1322" height="737" alt="Airline Passenger Satisfaction -  Dashboard 3" src="https://github.com/user-attachments/assets/110861a1-cb96-4410-93b9-5472a829a9e9" />


## 📈 Key Findings

Based on the cleaned dataset and dashboard analysis:

- The dataset contains 129,880 passenger records.
- 56,428 passengers are satisfied, representing 43.45%.
- 73,452 passengers are neutral or dissatisfied, representing 56.55%.
- Loyal customers account for approximately 106,100 passengers.
- Business travel accounts for approximately 90,000 passengers.
- Female passengers represent approximately 50.74% of the dataset, while male passengers represent 49.26%.
- The average passenger age is approximately 39.43 years.

### Airline Service Ratings

| Service | Average Rating |
|---|---:|
| Wi-Fi Service | 2.73 |
| Seat Comfort | 3.44 |
| Online Boarding | 3.25 |
| Food and Drink | 3.20 |
| Inflight Entertainment | 3.36 |

## 💡 Business Recommendations

1. **Improve Wi-Fi Services:** Evaluate ways to improve in-flight Wi-Fi connectivity and service quality.
2. **Enhance Passenger Comfort:** Continue improving seat comfort and onboard facilities.
3. **Improve Online Boarding:** Make online boarding easier and more convenient.
4. **Customer Retention:** Focus on maintaining loyalty through a better passenger experience.
5. **Travel Class Improvements:** Review service quality across Business, Eco and Eco Plus classes.
6. **Delay Management:** Monitor departure and arrival delays to improve punctuality and passenger communication.

## 📁 Project Repository Structure

```text
Airline-Passenger-Satisfaction-Analysis/
│
├── Python/
│   └── Airline_Satisfaction_EDA.ipynb
│
├── SQL/
│   └── airline_project.sql
│
├── PowerBI/
│   ├── Airline - Passenger Analysis.pbix
│   ├── Airline Passenger Satisfaction - Dashboard 3.png
│   ├── Passenger Demographics & Travel Analysis - Dashboard 2.png
│   └── Airline Service Quality Analysis - Dashboard 1.png
│
├── Dataset/
│   └── Airline_cleaned - Dataset.csv
│
└── README.md
```

## 🏁 Conclusion

This project demonstrates an end-to-end Data Analytics workflow using Python, MySQL and Power BI.

By combining data cleaning, exploratory data analysis, SQL querying and interactive dashboard development, I transformed airline passenger data into meaningful insights about customer satisfaction, passenger behaviour and airline service quality.

## 👨‍💻 Author

**Mundru Veda Vedya Ram**

Data Analytics | Python | MySQL | Power BI | Excel

- **GitHub:** [vedavedyaram](https://github.com/vedavedyaram)
- **LinkedIn:** [Mundru Veda Vedya Ram](https://www.linkedin.com/in/mvvram/)

## 📚 Dataset Reference

[Kaggle – Airline Passenger Satisfaction Dataset](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction)
