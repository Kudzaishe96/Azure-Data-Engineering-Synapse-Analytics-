# Azure-Data-engineering
## ETL project using Azure Synapse Analytics and Azure Data Bricks


## Table Of Contents

- [ Project Overview ](#Project-Overview)
- [ Data Source ](#Data-Source)
- [ Tools ](#Tools)
- [ Data Extraction and Cleaning ](#Data-Extraction-and-Cleaning)
- [ Data Modelling ](#Data-Modelling)
- [ Data Visualisation ](#Data-Visualisation)
- [ Explanatory Data Analysis](#Explanatory-Data-Analysis)
- [ Findings ](#Findings)

### Project Overview

This project seek to show the extraction of raw data into meaningfull sql views for data analytics 


### Data Source
EMR and CMR Data csv files uploaded in the Data Source

### Tools
- API
- Azure Synapse Analytics
- Azure DataBricks

  
### Azure Resources
- Azure Data lake
- Azure Synapse Analytics
- Azure DataBricks
- Azure App
- Serverless SQL
  

### Data Extraction (Bronze Layer)
1. Create A json format file for simulating an api call
2. Use the JSON file to extract the parameter values for the CSV files (Data Source) using an api that we feed into a lookup activity in Synapse Analytics
3. Use the lookup activity output values to feed the For loop activity which contains the Copy activity for our data sources.
4. Use parameters to create the file directory system in a hierachical way.
5. Run the Pipeline and extract the raw data into An Azure Data lake

   ### *Load Data*
   
  ![Screenshot 2025-06-24 174606](https://github.com/user-attachments/assets/903e5825-fb6a-44d3-bd03-03e6d0687668)
  ![Screenshot 2025-06-24 175017](https://github.com/user-attachments/assets/e8bdde12-bf57-4a57-acfa-864127d65946)


### Data Cleaning (Silver Layer)
1. Create an App that you attach a read and write access role using the managed identity
2. Use the app creadentials to attach it to the DataBricks appliction to connect to the Bronze Layer
3. Load Data into the Silver layer by using Pyspark
4. Remove duplicates, null values and create three tables namely dim_products, dim_customer, facts_sales
5. Store tables in the Silver layer as delta format
   

   ### *Relationship Model*
 

### Data Visualisation
1. Create a DAX Measures Table containing calculations for CSP Rate and PAYG Rate for report visualizations (for comparisons).
2. Design the report theme.
3. Select appropriate visualizations and format them according to the theme.
4. Conduct testing on the report.

   ### *Dashboard*
   ![Dashboard](https://github.com/user-attachments/assets/55c85c85-3917-4563-b4fc-d1d07ef09d9f)

    



### Explanatory Data Analysis
- Analyze costs per subscriptionName, MeterCategory, and ResourceGroup.
- Assess potential savings/costs using the CSP Rate.

### Findings
- The Finopps Core Production Subscription represents the highest liability to the organization when using the PAYG Rate.
- Transitioning to CSP yields significant savings for the company.

### Recommendation
1. I recommend the company switch to the CSP Rate, as it demonstrates a substantial reduction in costs compared to PAYG.
2. Increase the use of compute engines over storage to further minimize expenses.
