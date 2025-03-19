/*

================================================================================================
SCRIPT-000 CREATE DATA LOAD SCRIPT
================================================================================================

Script Purpose:
    - assumes this is a truncate and insert operation, therefore deletes all data in the destinatio table first
    - bulk insert of data into a db table
    - effectively handle large amount of data
    - bulk insert means all the data is added in one operation (as opposed to row by row insertion)
    - assumes loading data from one db table/CSV file into db existing table

WARNING:

    - This script will first delete all data in the destination table
    - Proceed with caution and ensure backups (if necessary) are already stored before proceeding.

*/

TRUNCATE TABLE schema.layer_name;
GO

-- sample SQL Server insert script from CSV file as a full load (all columns, all rows):
BULK INSERT schema.table_name
FROM 'drive\full\path\to\file.csv'
WITH (
    FIRST ROW = 2, -- because in a CSV file, the first row is actually just the col headings/names
    FIELDTERMINATOR = ',', -- assumes the delimiter used in the CSV file format is the comma, but this may vary
    TABLOCK -- this command locks the source table or file, making the entire operation mmore efficient
);

-- note: when working with CSV files specifically, it's very important to check the quality of the new table data to ensure column matching
-- very common to see data shifted in the columns of the output when working with a CSV file as the source
-- also check the number of rows against the original


-- sample PostgreSQL/SQL Server insert script from a db table, with specific conditions (as opposed to full load):
INSERT INTO products (product_no, name, price)
  SELECT product_no, name, price FROM new_products
    WHERE release_date = 'today';


/*
================================================================================================
RESOURCE(S)
-- Data with Baraa - SQL Data Warehouse from Scratch | Full Hands-On Data Engineering Project
-- https://www.youtube.com/watch?v=9GVqKuTVANE&t=5068s
*/