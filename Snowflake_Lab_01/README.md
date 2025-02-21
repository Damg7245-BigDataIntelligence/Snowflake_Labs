# Getting Started with Data Engineering Pipelines with Snowpark Python Notebook
This repository contains the code for the *Getting Started with Data Engineering using Snowflake Notebooks* Snowflake Quickstart.

### ➡️ For an overview, prerequisites, and detailed instructions, complete this end-to-end tutorial:  
[Data Engineering Pipelines with Snowpark Python](https://quickstarts.snowflake.com/guide/data_engineering_pipelines_with_snowpark_python/index.html?index=..%2F..index#0) on Quickstarts.Snowflake.com.

___
### **Overview of the Tutorial**
This tutorial walks through the key steps to set up a data engineering pipeline using **Snowflake Notebooks**.

<img src="images/01_DE_with_Snowpark_Overview.png" width=800px>

---

## **Step 1: Fork the Quickstart Repository and Enable GitHub Actions**
Fork the Data Engineering Pipelines with Snowpark Python repository.
Enable GitHub Actions in your forked repository.

📌 **Important**: Ensure workflows are enabled before proceeding.

<img src="images/02_Forked_Repo.png" width=800px>

---

## **Step 2: Create GitHub Codespace*
- Click "Code" → "Codespaces" → "Create codespace on main".
- This will launch a hosted VS Code environment.
<img src="images/03_Github_Codespace.png" width=800px>

---

## **Step 3: Configure Snowflake Credentials**
1. Open the `~/.snowflake/connections.toml` file.  
2. Replace **account, user, and password** with your credentials.  
3. Save and close the file.  

📌 **Note:** SnowCLI currently does not support **Key Pair authentication**.  
<img src="images/04_Connections.png" width=800px>

---

## Step 4: Setup Snowflake  
1. Install the **Snowflake Extension** for VS Code.  
2. Log in to Snowflake with **ACCOUNTADMIN** permissions.  
3. Open `steps/01_setup_snowflake.sql` in VS Code.  
4. Run all queries using **"Execute All Statements"** button on vscode.  

<img src="images/05_snowflake_setup.png" width=800px>

---

## **Step 5:  Load Raw Data **
1. Execute `steps/02_load_raw.py` to load raw data.  
2. This can be done via the **VS Code terminal**.

<img src="images/06_RAW_Data_Load.png" width=800px>

---

## **Step 6: Load Weather Data**
Connect to **Weather Source LLC: frostbyte** in the **Snowflake Marketplace**:  
1. Login to **Snowsight** → **Marketplace**.  
2. Search and select **Weather Source LLC: frostbyte**.  
3. Click **Get**, set database name to `FROSTBYTE_WEATHERSOURCE`, and assign role `HOL_ROLE`.  
✅ **Screenshot**: Run the query to verify data:    

```sql
SELECT * FROM FROSTBYTE_WEATHERSOURCE.ONPOINT_ID.POSTAL_CODES LIMIT 100;
```  

<img src="images/07_Weather_Data.png" width=800px>

---

## **Step 7: Create POS View (CDC Streams)**
Run the script from the terminal:  

```sh
cd steps  
python 04_create_pos_view.py  
```  

The Snowpark **DataFrame API** defines the POS view and enables **Change Data Capture (CDC)** via Snowflake Streams.  

✅ **Screenshot**: Successful creation of streams

<img src="images/08_Create_Streams.png" width=800px>

---

## **Step 8: Fahrenheit to Celsius UDF**

Deploy the UDF using **SnowCLI**:  

```sh
cd steps/05_fahrenheit_to_celsius_udf  
snow snowpark build  
snow snowpark deploy  
```  

Run in Snowflake:  

```sql
SELECT ANALYTICS.FAHRENHEIT_TO_CELSIUS_UDF(35);
```  

✅ **Screenshot**: Subscription confirmation.

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/load_weather_data.png" width=800px>

---

## **Step 9: Load Excel Files**
- Run `DEV_06_load_excel_files` Notebook to load:
  - **LOCATION** table
  - **ORDER_DETAIL** table

✅ **Screenshot**: Sample rows from loaded tables. 

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/load_excel_files.png" width=800px>

---

## **Step 10: Load Daily City Metrics**
- Run `DEV_07_load_daily_city_metrics` Notebook to create `DAILY_CITY_METRICS`.

✅ **Screenshot**: Table verification.  

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/load_weather_data.png" width=800px>

---

## **Step 11: Orchestrate Pipelines**
- Use the **Snowflake Python API** to create a Task DAG:
  - **Task 1**: `LOAD_EXCEL_FILES_TASK`
  - **Task 2**: `LOAD_DAILY_CITY_METRICS`
- Deploy and run the DAG.

✅ **Screenshot**: DAG execution result.  

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/pipeline.png" width=800px>

---

## **Step 12: Deploy to Production**
1. Modify a **notebook**, commit to `dev`, and merge to `main`.
2. Run **GitHub Actions workflow** and verify deployment.
3. Deploy and run the **production DAG**.

✅ **Screenshot**: Successful deployment.  

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/pull_request.png" width=800px>

---

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/deplyed.png" width=800px>

---

## 🎯 **Final Thoughts**
This guide walks through setting up, running, and deploying a **Snowflake Data Engineering pipeline** with Notebooks. Follow these structured steps to execute the workflow efficiently.

🚀 **Happy Coding!**
