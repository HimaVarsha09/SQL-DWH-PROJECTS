/*
---------------------------------------------------------
Create Database  and Schemes
--------------------------------------------------------------------
Script Purpose:
This script creates database named "Datawarehouse after checking if it already ists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
within the database: "bronze', "silver", and "gold".


WARNING:
Running this script will drop the entire Detallarehouse" database if it exists.
All data in the database will be permanently deleted. Proceed with caution and 
ensure you have proper Backups before running this script.

*/

USE MASTER;
GO

--Drop and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABSE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse'database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
Go

CREATE SCHEMA Silver;
GO

CREATE SCHEMA GOLD;
GO


