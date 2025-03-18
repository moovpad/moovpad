/*

================================================================================================
SCRIPT-000 CREATE DATABASE & SCHEMAS
================================================================================================

Script Purpose:
    - create a new db called 'data_warehouse'
    - first checks if db exists
    - if so, it is dropped and recreated
    - then creates schemas for the relevant layers

WARNING:

    - This script will delete the 'data_warehouse' db if it exists.
    - All data in the database will be lost if so.
    - Proceed with caution and ensure backups are already stored before proceeding.

*/

USE master; --signals that we are using the system db Master, to create the new db
GO -- this will then switch to the data_warehouse db for the next set of commnds to be executed against

-- first we check if the database already exists and remove if so - if we don't, we'll get an error to say it already exists
-- note: the syntax for the check statement below is specific to SQL Server - check proper syntax if using a different DBMS
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'data_warehouse')
BEGIN
    ALTER DATABSE data_warehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE data_warehouse;
END
GO

-- now we can start creating teh database
CREATE DATABASE data_warehouse;
GO
-- witch to the db
USE data_warehouse;
GO
--create the schemas
CREATE SCHEMA bronze;
GO

CREATE ScHEMA silver;
GO

CREATE SCHEMA gold;
GO





/*
================================================================================================
RESOURCE(S)
-- Data with Baraa - SQL Data Warehouse from Scratch | Full Hands-On Data Engineering Project
-- https://www.youtube.com/watch?v=9GVqKuTVANE&t=5068s
*/