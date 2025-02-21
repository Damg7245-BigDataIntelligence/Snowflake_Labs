-- ################################################################
-- Create SHARED_CONTENT_SCHEMA to share in the application package
-- ################################################################

-- Step 1: Ensure the application package database exists
CREATE APPLICATION PACKAGE IF NOT EXISTS NATIVE_APP_QUICKSTART_PACKAGE_PKG_JANVICHITRODA;

-- Step 2: Use the correct database
USE DATABASE NATIVE_APP_QUICKSTART_PACKAGE_PKG_JANVICHITRODA;

-- Step 3: Ensure the schema for shared content exists
CREATE SCHEMA IF NOT EXISTS shared_content_schema;

-- Step 4: Switch to the schema
USE SCHEMA shared_content_schema;

-- Step 5: Ensure the source view exists before creating the dependent view
CREATE OR REPLACE VIEW MFG_SHIPPING AS 
SELECT * FROM NATIVE_APP_QUICKSTART_DB.NATIVE_APP_QUICKSTART_SCHEMA.MFG_SHIPPING;

-- Step 6: Grant permissions correctly (fixing the 'APPLICATION' error)
-- If using an application package:
grant usage on schema shared_content_schema to share in application package NATIVE_APP_QUICKSTART_PACKAGE_PKG_JANVICHITRODA;
grant reference_usage on database NATIVE_APP_QUICKSTART_DB to share in application package NATIVE_APP_QUICKSTART_PACKAGE_PKG_JANVICHITRODA;
grant select on view MFG_SHIPPING to share in application package NATIVE_APP_QUICKSTART_PACKAGE_PKG_JANVICHITRODA;