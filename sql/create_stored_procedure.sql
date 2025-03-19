/*

================================================================================================
SCRIPT-000 CREATE STORED PROCEDURE
================================================================================================

Script Purpose:
    - create a stored procedure for running SQL scripts that are frequently used
    - may include examples like the loading data scripts
    - the example looks at a stored procedure for loading data into a layer of a data mesh (data warehouse)
    - example below includes formatting of the output messages using PRINT statements
    - this example also icludes datetime stamps for each step and error handling using the try-catch blocks
    - to run the stored procedure can use a command such as 'EXEC schema.stored_procedure_name'

WARNING:

    - This script will first delete all data in the destination tables
    - Proceed with caution and ensure backups (if necessary) are already stored before proceeding.

*/

CREATE OR ALTER PROCEDURE schema.load_layer AS
BEGIN
    DECLARE @procedure_start DATETIME, @procedure_end DATETIME, @start_time DATETIME, @end_time DATETIME; -- variables to hold the start and end times of the script run
    BEGIN TRY -- error handling TRY block
        SET @procedure_start = GETDATE();
        PRINT '============================================================================';
        PRINT 'SCRIPT-000 Loading Data-Mesh Layer: XXXXXX';
        PRINT '============================================================================';
        PRINT '---';
        PRINT '---';
        PRINT 'PART-01 - Loading Table XX';
        PRINT '---';
        PRINT '---';
        -- insert the desired script contents here (e.g. see create_load_script.sql file)
        -- table 1
        SET @start_time = GETDATE();
        PRINT '## Truncating Table XX';
        TRUNCATE TABLE schema.table_name;
        GO

        PRINT '## Inserting Data Into Table XX';
        INSERT INTO schema.table_name (product_no, prod_name, prod_price)
        SELECT product_no, prod_name, prod_price FROM source.table_name
            WHERE release_date = 'today'; -- use whichever condition(s) meet the requirements
        GO
        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- table 2
        SET @start_time = GETDATE();
        PRINT '---';
        PRINT '---';
        PRINT 'PART-02 - Loading Table XX';
        PRINT '---';
        PRINT '---';
        
        PRINT '## Truncating Table XX';
        TRUNCATE TABLE schema.table_name;
        GO

        PRINT '## Inserting Data Into Table XX';
        INSERT INTO schema.table_name (cust_no, cust_name, cust_price)
        SELECT cust_no, cust_name, cust_price FROM source.table_name
            WHERE join_date = 'today'; -- use whichever condition(s) meet the requirements
        GO
        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- add other scripts as needed...

    PRINT '============================================================================';
    PRINT 'Loading Tables Complete.'
    PRINT 'Entire Procedure Duration: ' + CAST (DATEDIFF(second, @procedure_start, @procedure_end) AS NVARCHAR) + ' seconds';
    PRINT '============================================================================';
    END TRY
    BEGIN CATCH -- error handling CATCH block
        PRINT '============================================================================';
        PRINT 'ERROR OCCURRED WHILE RUNNING SCRIPT-000 Loading Data-Mesh Layer: XXXXXX';
        PRINT '---';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR CODE: ' + CAST (ERROR_MESSAGE() AS NVARCHAR);
        PRINT '============================================================================';
    END CATCH
    SET @procedure_end = GETDATE();

END


/*
================================================================================================
RESOURCE(S)
-- Data with Baraa - SQL Data Warehouse from Scratch | Full Hands-On Data Engineering Project
-- https://www.youtube.com/watch?v=9GVqKuTVANE&t=5068s
*/