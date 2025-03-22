/*

================================================================================================
SCRIPT-000 CREATE TABLE
================================================================================================

Script Purpose:
    - this script fills a validated table (see create_table.sql) from a know existing table
    - allows specifying the column statement for transformations (f necessary) and a table statement (for conditional statements)
    - all necessary inputs will be stored in a separate variables file specific for purpose

WARNING:

    - This script may generate errors, which needs to be handled in the Ansible playbook tasks
    - Proceed with caution and ensure backups (if necessary) are already stored before proceeding.

*/

INSERT INTO 
1{ schema_name }.{ table_name } 
2({ table_cols })
SELECT
3{ col01_statement },
4{ col02_statement },
5{ col03_statement },
6{ col04_statement },
7{ col05_statement },
8{ col06_statement },
9{ col07_statement },
10{ col08_statement },
11{ col09_statement },
12{ col10_statement }
FROM
13{ table_statement };
GO