/*

================================================================================================
SCRIPT-000 CREATE DATABASE SCHEMA
================================================================================================

Script Purpose:
    - develop a template stored procedure SQL script, to be edited by Ansible playbooks to facilitate:
        - create a new db user
        - specify the relevant user assignments
        - add an encrypted password
        - set an expiry date for the user (which may be set to 'infinity')

WARNING:

    - Proceed with caution and ensure user assignments are appropriate, passwords are encrypted when stored, 
    and a suitable expiration is set.

*/

CREATE ROLE 
1{ user_name } 
WITH LOGIN
2{ user_assignments }
ENCRYPTED PASSWORD
3{ encr_pass };
VALID UNTIL
4{ expire }
GO