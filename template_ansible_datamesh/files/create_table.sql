/*

================================================================================================
SCRIPT-000 CREATE TABLE
================================================================================================

Script Purpose:
    - this script drops the existing table, if present, and re-creates it as specified. woth the given schema
    - allows specifying the columns as stored in a separate variables file

WARNING:

    - This script will first delete all data in the destination table(s)
    - Proceed with caution and ensure backups (if necessary) are already stored before proceeding.

*/

IF OBJECT_ID ( 
1{ schema_name }.{ table_name }, 
'U') IS NOT NULL
DROP TABLE 
2{ schema_name }.{ table_name };
CREATE TABLE 
3{ schema_name }.{ table_name } (
4{ table_cols }
);
GO