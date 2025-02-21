
#  Creates the database, warehouse, schema, and defines the table that will hold the shipping data 

snowsql -c default -q "
CREATE OR REPLACE WAREHOUSE NATIVE_APP_QUICKSTART_WH WAREHOUSE_SIZE=SMALL INITIALLY_SUSPENDED=TRUE;

-- this database is used to store our data
CREATE OR REPLACE DATABASE NATIVE_APP_QUICKSTART_DB;
USE DATABASE NATIVE_APP_QUICKSTART_DB;

CREATE OR REPLACE SCHEMA NATIVE_APP_QUICKSTART_SCHEMA;
USE SCHEMA NATIVE_APP_QUICKSTART_SCHEMA;

CREATE OR REPLACE TABLE MFG_SHIPPING (
  order_id NUMBER(38,0), 
  ship_order_id NUMBER(38,0),
  status VARCHAR(60),
  lat FLOAT,
  lon FLOAT,
  duration NUMBER(38,0)
);"

# Upload Consumer Supply Chain Data (Consumer provided data) table creation script

snowsql -c default -q "
USE WAREHOUSE NATIVE_APP_QUICKSTART_WH;

-- this database is used to store our data
USE DATABASE NATIVE_APP_QUICKSTART_DB;

USE SCHEMA NATIVE_APP_QUICKSTART_SCHEMA;

CREATE OR REPLACE TABLE MFG_ORDERS (
  order_id NUMBER(38,0), 
  material_name VARCHAR(60),
  supplier_name VARCHAR(60),
  quantity NUMBER(38,0),
  cost FLOAT,
  process_supply_day NUMBER(38,0)
);


CREATE OR REPLACE TABLE MFG_SITE_RECOVERY (
  event_id NUMBER(38,0), 
  recovery_weeks NUMBER(38,0),
  lat FLOAT,
  lon FLOAT
);"


# loading shipping data into table stage
#snow stage copy ./app/data/shipping_data.csv @%MFG_SHIPPING --database NATIVE_APP_QUICKSTART_DB --schema NATIVE_APP_QUICKSTART_SCHEMA


# Load csv file to the corresponding table (use dedicated stage for each table)
# loading shipping data into table stage
# loading orders data into table stage
# loading site recovery data into table stage
snowsql -c default -q "
USE DATABASE NATIVE_APP_QUICKSTART_DB;
USE SCHEMA NATIVE_APP_QUICKSTART_SCHEMA;

-- Create internal stages if they don’t exist
CREATE OR REPLACE STAGE MFG_SHIPPING;
CREATE OR REPLACE STAGE MFG_ORDERS;
CREATE OR REPLACE STAGE MFG_SITE_RECOVERY;

-- Upload files to respective stages
PUT 'file://$(pwd)/app/data/shipping_data.csv' @MFG_SHIPPING AUTO_COMPRESS=FALSE;
PUT 'file://$(pwd)/app/data/order_data.csv' @MFG_ORDERS AUTO_COMPRESS=FALSE;
PUT 'file://$(pwd)/app/data/site_recovery_data.csv' @MFG_SITE_RECOVERY AUTO_COMPRESS=FALSE;

-- Copy data from the staged files into respective tables
COPY INTO MFG_SHIPPING
FROM @MFG_SHIPPING
FILE_FORMAT = (TYPE = 'CSV', SKIP_HEADER=0, FIELD_OPTIONALLY_ENCLOSED_BY='\"');

COPY INTO MFG_ORDERS
FROM @MFG_ORDERS
FILE_FORMAT = (TYPE = 'CSV', SKIP_HEADER=0, FIELD_OPTIONALLY_ENCLOSED_BY='\"');

COPY INTO MFG_SITE_RECOVERY
FROM @MFG_SITE_RECOVERY
FILE_FORMAT = (TYPE = 'CSV', SKIP_HEADER=0, FIELD_OPTIONALLY_ENCLOSED_BY='\"');
"


# Copy data from stage to the table

# snow sql -q"USE WAREHOUSE NATIVE_APP_QUICKSTART_WH;
# -- this database is used to store our data
# USE DATABASE NATIVE_APP_QUICKSTART_DB;

# USE SCHEMA NATIVE_APP_QUICKSTART_SCHEMA;

# COPY INTO MFG_SHIPPING
# FILE_FORMAT = (TYPE = CSV
# FIELD_OPTIONALLY_ENCLOSED_BY = '\"');

# COPY INTO MFG_ORDERS
# FILE_FORMAT = (TYPE = CSV
# FIELD_OPTIONALLY_ENCLOSED_BY = '\"');

# COPY INTO MFG_SITE_RECOVERY
# FILE_FORMAT = (TYPE = CSV
# FIELD_OPTIONALLY_ENCLOSED_BY = '\"');
# "
