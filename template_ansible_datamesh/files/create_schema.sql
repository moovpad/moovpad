/*

================================================================================================
SCRIPT-000 CREATE DATABASE SCHEMA
================================================================================================

Script Purpose:
    - develop a template stored procedure SQL script, to be edited by Ansible playbooks to facilitate:
        - connect to a newly created db (see create_db.sql)
        - create a new db schema with specified user authorisation
        - add a schema description as a comment for easy reference
        - grant all privileges for the schema to a specified user

WARNING:

    - This script will delete the schema and all subordiante objects
    - Proceed with caution and ensure backups (if necessary) are already stored before proceeding.

*/

CONNECT 
1{ db_name };
GO

DROP SCHEMA [IF EXISTS] 
2{ schema_name }
[CASCADE];
GO

CREATE SCHEMA 
3{ schema_name }
AUTHORIZATION 
4{ user_name };
GO

COMMENT ON SCHEMA 
5{ schema_name }
IS 
6{ schema_desc };
GO

GRANT ALL ON SCHEMA 
7{ schema_name } 
TO 
8{ user_name };
GO

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
9{ schema_name }
GRANT ALL ON TABLES TO 
10{ user_name };
GO

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
11{ schema_name }
GRANT ALL ON SEQUENCES TO 
12{ user_name };
GO

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
13{ schema_name }
GRANT EXECUTE ON FUNCTIONS TO 
14{ user_name };
GO

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
15{ schema_name }
GRANT USAGE ON TYPES TO 
16{ user_name };
GO