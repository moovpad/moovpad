/*

================================================================================================
SCRIPT-000 CREATE DATABASE SCHEMA
================================================================================================

Script Purpose:
    - develop a template stored procedure SQL script, to be edited by Ansible playbooks to facilitate:
        - create a new db if it does not currently exist
        - specify the new db name
        - grant priveleges on db to a specified user (see create_user.sql).

WARNING:

    - This script will grant all priveleges to a specified user
    - Proceed with caution and ensure the priveleges granted are appropriate, or use an alternative configuration

*/

CREATE DATABASE 
1{ db_name }
WHERE NOT EXISTS (SELECT FROM pg_databse 
WHERE datname = 
2{ db_name });
GRANT 
3{ user_priveleges } ON DATABASE 
4{ db_name } TO 
5{ user_name };
GO