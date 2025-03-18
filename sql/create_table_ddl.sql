/*

================================================================================================
SCRIPT-000 CREATE DDL & VALIDATION - BRONZE LAYER
================================================================================================

Script Purpose:
    - check if object (each table) exists
    - if so, first drop the table before proceeding
    - create the DDL for each of the bronze layer tables
    - repeat the check and DDL process for each table

WARNING:

    - This script will delete the relevant tables in the db if they exist.
    - All data in the database tables will be lost if so.
    - Proceed with caution and ensure backups are already stored before proceeding. 

*/

-- note: the syntax for the check statement below is specific to SQL Server - check proper syntax if using a different DBMS
IF OBJECT_ID ('layer.system_table_name', 'U') IS NOT NULL -- the 'U' means user defined table
    DROP TABLE bronze.system_table_name;
-- the above check needs to be made before the definition for each table's DDL
CREATE TABLE bronze.system_table_name (
    cst_id, INT,
    cst_key, NVARCHAR(50),
    cst_name_first, NVARCHAR(50),
    cst_name_surname, NVARCHAR(50),
    cst_create_date, DATE
    -- etc, for each column specify col name and data type
);
GO
-- then we can execute the command above, which will create the table(s)
-- each of the tables as defined by the example above is referred to as a DDL
-- DDL = Data definition language
-- repeat above template script section for each table


/*
================================================================================================
RESOURCE(S)
-- Data with Baraa - SQL Data Warehouse from Scratch | Full Hands-On Data Engineering Project
-- https://www.youtube.com/watch?v=9GVqKuTVANE&t=5068s
*/