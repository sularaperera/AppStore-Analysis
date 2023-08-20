<img src=https://github.com/sularaperera/AppStore-Analysis-SQL/blob/main/images/banner.png></img>

## Table of Contents
  - Introduction
  - Data Description
  - Data Loading and Database Setup
  - Data Analysis
  - Conclusion

## 1. Introduction
In this documentation, we will explore the process of unlocking insights and valuable information from app store data. We will be working with two CSV files, namely AppleStore.csv and appleStore_description_combined.csv, containing data related to 7197 apps across 23 different app genres. The data will be loaded into a Microsoft SQL Server database for further analysis.

## 2. Data Description
The dataset comprises information about apps available on the app store. The AppleStore.csv file contains general details about the apps, while the appleStore_description_combined.csv file includes additional textual data related to the apps.

## 3. Data Loading and Database Setup
To begin the analysis, we will load the provided CSV files into a Microsoft SQL Server database. Follow these steps:

-  Create a new database in your SQL Server.
-  Create two tables named AppleStore and appleStore_description_combined with the appropriate columns that match the fields in the CSV files.
-  Use SQL Server Management Studio or any SQL tool of your choice to import the CSV files into their respective tables.

## 4. Data Analysis
Once the data is loaded into the database, you can perform various analyses to unlock insights from the app store data. Here are a few example queries and analyses you can conduct:

![image](https://github.com/sularaperera/AppStore-Analysis-SQL/assets/7954206/9b7eb268-cc73-40cf-945b-14dbb00bf1a1)

![image](https://github.com/sularaperera/AppStore-Analysis-SQL/assets/7954206/911d2f51-0c64-47ae-926e-8924bf7bbe5f)

![image](https://github.com/sularaperera/AppStore-Analysis-SQL/assets/7954206/485a890e-c97a-458a-a9b5-d7ec1f713028)


## 5. Conclusion
Unlocking the power of app store data involves loading and analyzing the data to gain valuable insights. By leveraging SQL queries and data analysis techniques, you can uncover trends, user preferences, and make informed decisions related to app development, marketing, and user engagement.

Remember that this documentation provides a starting point for your analysis. You can further explore advanced analytics, machine learning, and visualization techniques to delve deeper into the dataset and extract even more valuable information from it.


Please refer to ["SQLQuery.sql"](https://github.com/sularaperera/AppStore-Analysis-SQL/blob/main/SQLQuery.sql) file to see the entire sql script used to extract insights.
