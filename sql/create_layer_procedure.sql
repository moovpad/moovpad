/*

================================================================================================
SCRIPT-000 CREATE LAYER PROCEDURE
================================================================================================

Script Purpose:
    - this procedure begins by dropping and then re-creating two tables for the silver layer (data transformation layer)
    - data is then first quality checked for duplication, missing and null values,and undergoes necessary transofrmations before loading into the new tables

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
        PRINT 'PART-01 - Create Table silver.crm_cst_info';
        PRINT '---';
        PRINT '---';

        IF OBJECT_ID ('silver.crm_cst_info', 'U') IS NOT NULL
            DROP TABLE silver.crm_cst_info;
        CREATE TABLE silver.crm_cst_info (
            cst_id INT,
            cst_key NVARCHAR(50),
            cst_firstname NVARCHAR(50),
            cst_lastname NVARCHAR(50),
            cst_gender NVARCHAR(50),
            cst_create_date DATE,
            dmesh_create_date DATETIME2 DEFAULT GETDATE()
        );
        GO

        PRINT '---';
        PRINT '---';
        PRINT 'PART-02 - Create Table silver.prd_prod_info';
        PRINT '---';
        PRINT '---';

        IF OBJECT_ID ('silver.prd_prod_info', 'U') IS NOT NULL
            DROP TABLE silver.prd_prod_info;
        CREATE TABLE silver.prd_prod_info (
            prod_id INT,
            cat_id NVARCHAR(50),
            prod_key NVARCHAR(50),
            prod_name NVARCHAR(50),
            prod_colour NVARCHAR(50),
            prod_cost INT,
            prod_start_date DATE,
            prod_end_date DATE,
            dmesh_create_date DATETIME2 DEFAULT GETDATE()
        );
        GO

        PRINT '---';
        PRINT '---';
        PRINT 'PART-03 - Loading Table silver.crm_cst_info';
        PRINT '---';
        PRINT '---';

        INSERT INTO silver.crm_cst_info (
            col_1,
            col_2,
            col_3,
            col_4,
            col_5
        )
        SELECT
        cst_id,
        cst_key,
        TRIM(cst_firstname) AS cst_firstname,
        TRIM(cst_lastname) AS cst_lastname,
        CASE    WHEN UPPER(TRIM(cst_gend)) = 'F' THEN 'Female'
                WHEN UPPER(TRIM(cst_gend)) = 'M' THEN 'Male'
                ELSE 'N/A'
        END AS cst_gend,
        cst_create_date
        FROM (
            ROW_NUMBER() OVER (PARTITION BY key_value ORDER BY create_date DESC) AS flag_last
            FROM bronze.crm_cst_info
            WHERE key_value IS NOT NULL
        )t WHERE flag_last = 1

        PRINT '---';
        PRINT '---';
        PRINT 'PART-04 - Loading Table silver.prd_prod_info';
        PRINT '---';
        PRINT '---';

        INSERT INTO silver.prd_prod_info (
            prod_id INT,
            cat_id NVARCHAR(50),
            prod_key NVARCHAR(50),
            prod_name NVARCHAR(50),
            prod_colour NVARCHAR(50),
            prod_cost INT,
            prod_start_date DATE,
            prod_end_date DATE,
        )
        SELECT
        prod_id,
        prod_key,
        REPLACE((SUBSTRING(prod_key, 1, 5) AS cat_id), '_', '-'),
        REPLACE((SUBSTRING(prod_key, 7, LEN()) AS prod_key), '_', '-'),
        TRIM(prod_name) AS prod_name,
        CASE UPPER(TRIM(prod_colour))
            WHEN 'WT' THEN 'White'
            WHEN 'BK' THEN 'Black'
            WHEN 'RD' THEN 'Red'
            ELSE 'N/A'
        END AS prod_colour,
        ISNULL(prod_cost, 0) AS prod_cost,
        CAST (prod_start_date AS DATE) AS prod_start_date,
        CAST (LEAD(prod_end_date) OVER (PARTITION BY prod_key ORDER BY prod_start_date) - 1 AS DATE) AS prod_end_date
        FROM bronze.prd_prod_info
    END TRY
    CATCH
        PRINT '============================================================================';
        PRINT 'ERROR OCCURRED WHILE RUNNING SCRIPT-000 Loading Data-Mesh Layer: XXXXXX';
        PRINT '---';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR CODE: ' + CAST (ERROR_MESSAGE() AS NVARCHAR);
        PRINT '============================================================================';
    END CATCH
END

-- NOTE: this sample stored procedure looks at just two tables being created and loaded, while real life scenarios would of course require more than this.
-- Also note that only a relative few types of data transofrmations have been demonstrated in this procedure, as specific requirements will vary based on
-- the relative system needs.

/*
================================================================================================
RESOURCE(S)
-- Data with Baraa - SQL Data Warehouse from Scratch | Full Hands-On Data Engineering Project
-- https://www.youtube.com/watch?v=9GVqKuTVANE&t=5068s
*/