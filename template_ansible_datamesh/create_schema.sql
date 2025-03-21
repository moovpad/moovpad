/*

================================================================================================
SCRIPT-000 CREATE DATABASE SCHEMA
================================================================================================

Script Purpose:
    - develop a template stored procedure SQL script, to be edited by Ansible playbooks to facilitate:
        - create a new db schema with specified user authorisation
        - add a schema description as a comment for easy reference
        - grant all privileges for the schema to a specified user

WARNING:

    - This script will delete the schema and all subordiante objects
    - Proceed with caution and ensure backups (if necessary) are already stored before proceeding.

*/

DROP SCHEMA [IF EXISTS] 
0{ schema_name }
[CASCADE];

CREATE SCHEMA 
1{ schema_name }
AUTHORIZATION 
2{ user_name };

COMMENT ON SCHEMA 
3{ schema_name }
IS 
4{ schema_desc };

GRANT ALL ON SCHEMA 
5{ schema_name } 
TO 
6{ user_name };

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
7{ schema_name }
GRANT ALL ON TABLES TO 
8{ user_name };

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
9{ schema_name }
GRANT ALL ON SEQUENCES TO 
10{ user_name };

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
11{ schema_name }
GRANT EXECUTE ON FUNCTIONS TO 
12{ user_name };

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA 
13{ schema_name }
GRANT USAGE ON TYPES TO 
14{ user_name };