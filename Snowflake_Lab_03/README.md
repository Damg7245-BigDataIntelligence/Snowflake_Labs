# Getting Started with Snowflake Native Apps

### This repository contains the sample code for the [Getting Started with Snowflake Native Apps Quickstart](https://quickstarts.snowflake.com/guide/getting_started_with_native_apps/). 

![Snowflake Native Apps](https://quickstarts.snowflake.com/guide/getting_started_with_native_apps/img/edcfa4000a03ae36.png)

## Additional Resources

- [Snowflake Native App Developer Toolkit](https://www.snowflake.com/snowflake-native-app-developer-toolkit/?utm_source=github&utm_medium=github&utm_campaign=na-us-en-eb-developer-toolkit-github)

## Steps to Set Up Snowflake Native Apps

### 1. Upload Provider Shipping Data
- Create a database, warehouse, and schema to store provider shipping data.
- Define the `MFG_SHIPPING` table.
- Run the `prepare_data.sh` script to execute the commands.

### 2. Upload Consumer Supply Chain Data
- Create tables `MFG_ORDERS` and `MFG_SITE_RECOVERY` for consumer data.
- Upload `.csv` files using Snowflake's table stage.
- Load the data into tables using `COPY INTO` SQL commands.

### 3. Share Provider Shipping Data
- Create a schema (`shared_content_schema`) for sharing data in the application package.
- Create a view for `MFG_SHIPPING`.
- Grant necessary permissions (`USAGE`, `REFERENCE_USAGE`, `SELECT`) for secure sharing.

### 4. Create App Package
- An application package acts like an installer for Snowflake.
- Use `snow app run` to create and upload the Snowflake Native Application package.


### 5. Streamlit Integration
- Integrate Streamlit for interactive UI elements.
- Deploy Streamlit within the Snowflake Native App.

![Streamlit Integration](https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_03/Images/strreamlit.png)
![Streamlit Integration](https://github.com/Damg7245-BigDataIntelligence/Snowflake_Labs/blob/main/Snowflake_Lab_03/Images/streamlit2.png)


This process ensures secure data sharing between providers and consumers while keeping proprietary data protected within Snowflake.
