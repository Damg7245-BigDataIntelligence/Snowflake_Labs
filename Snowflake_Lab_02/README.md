# Data Engineering with Notebooks
This repository contains the code for the *Data Engineering with Notebooks* Snowflake Quickstart.

### ➡️ For an overview, prerequisites, and detailed instructions, complete this end-to-end tutorial:  
[Data Engineering with Notebooks](https://quickstarts.snowflake.com/guide/data_engineering_with_notebooks/index.html?index=..%2F..index#0) on Quickstarts.Snowflake.com.

___
### **Overview of the Tutorial**
This tutorial walks through the key steps to set up a data engineering pipeline using **Snowflake Notebooks**.

<img src="images/quickstart_overview.png" width=800px>

---

## **Step 1: Create a Branch in GitHub**
Before setting up the environment, create a `dev` branch in your forked repository.

📌 **Important**: Ensure the `dev` branch exists before proceeding.  
Refer to the Quickstart guide for instructions.

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/setup_branch.png" width=800px>

---

## **Step 2: Configure GitHub Actions**
- Set up **GitHub Actions** to automate deployments.
- Ensure your repo is correctly configured before proceeding.

---

## **Step 3: Download and Import the Notebook**
1. **Log into Snowsight**.
2. **Navigate to "Notebooks"** under Projects.
3. **Import the Notebook**:
   - Click the **arrow** next to "+ Notebook".
   - Select **"Import .ipynb file"**.
   - Upload **00_start_here.ipynb**.
4. **Choose a Database, Schema, and Warehouse**.
5. Click **"Create"**.

---

## **Step 4: Install the Snowflake Package**
1. Open the **00_start_here.ipynb** Notebook.
2. Click **"Packages"** in the top menu.
3. Search for **"snowflake"** under **Find Packages** and add it.

---

## **Step 5: Run the Setup Notebook**
1. Click **"Start"** to initialize the Notebook session.
2. Scroll to **Step 03 Setup Snowflake**.
3. Update the **4 GITHUB_ SQL variables**:
   - Set **GITHUB_SECRET_PASSWORD** to your **GitHub personal access token**.
4. Run all cells:
   - Press **CMD/CTRL + Enter**, or  
   - Click the **Run arrow** in the top-right.

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/setup_variable.png" width=800px>

---

## **Step 6: Setup Snowflake**
1. **Update SQL Variables** (GitHub username, PAT, repo details).
2. **Create Account-Level Objects**:
   - Assign roles, create `DEMO_DB`, and `DEMO_WH`.
3. **Create Database-Level Objects**:
   - Define schemas (`INTEGRATIONS`, `DEV_SCHEMA`, `PROD_SCHEMA`).
4. **Set Up External Storage & Secrets**:
   - Create an S3 stage, GitHub secret, and API integration.
5. **Configure Git Repository**:
   - Connect Snowflake to your **forked GitHub repo**.
6. **Create Event Table** (`DEMO_EVENTS`) and assign permissions.

✅ **Screenshot**: Environment setup confirmation.  

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/create_db_role.png" width=800px>

---

## **Step 7: Deploy Notebooks to Dev**
- Execute `deploy_notebooks.sql` using `EXECUTE IMMEDIATE FROM`.

✅ **Screenshot**: Successful deployment. 

<img src="https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_02/images/deploy_notebook.png" width=800px>

---

## **Step 8: Load Weather Data**
- Subscribe to **"Weather Source LLC: frostbyte"** in **Snowflake Data Marketplace**.

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
