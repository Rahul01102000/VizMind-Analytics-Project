Telco Customer Churn Analysis
-----------------------------

Project Overview:
-----------------
This project analyzes customer churn for a telecommunications company. The goal is to identify factors contributing to churn and understand churn behavior based on different customer attributes such as gender, contract type, tenure, and internet service.

The dataset used contains information about customers, including demographic details, subscription information, and churn status (whether a customer has left the company or not). The analysis was performed using SQL queries to derive meaningful insights and support decision-making.

Key Objectives:
---------------
1. Calculate the overall churn rate and the percentage of churned customers.
2. Analyze churn by different customer attributes:
   - Gender
   - Contract Type
   - Internet Service Type
   - Customer Tenure Group (duration as a customer)
3. Generate exported CSV files with the results for further analysis and reporting.

Tools Used:
------------
1. **SQL Server**: SQL queries were used to extract, manipulate, and analyze the data.
2. **CSV**: The results of the SQL queries were exported to CSV format for further analysis and reporting.

Files in This Project:
-----------------------
- **TelcoChurn_Analysis.sql**: This file contains all the SQL queries used to analyze the customer churn dataset.
- **TelcoCustomers.csv**: The original customer dataset used for analysis.
- **TelcoChurn_ExportedData**: Folder containing the exported results of the SQL queries:
  - **Churn_Overall.csv**: Churn rate for all customers.
  - **Churn_By_Gender.csv**: Churn rate by customer gender.
  - **Churn_By_Contract.csv**: Churn rate by contract type.
  - **Churn_By_TenureGroup.csv**: Churn rate by customer tenure group.
- **README.txt**: This file, providing an overview of the project.

Next Steps / Recommendations:
-----------------------------
- The exported data can be further analyzed using Excel or other visualization tools to generate insights into churn patterns and trends.
- Further statistical analysis can be performed to identify other potential drivers of churn and create models for churn prediction.

Project Summary:
----------------
This project demonstrates an in-depth analysis of customer churn in the telecom industry. By using SQL, I was able to generate a comprehensive set of insights into how various factors affect churn. The exported CSV data serves as a basis for creating reports and strategic decision-making.

For further inquiries or questions about this project, feel free to contact me.

-- Rahul Kashyap
