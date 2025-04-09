# ETL Process for Adding JSON Data to SQL Database

## Table of Contents
- [Overview](#overview)
- [Project Description](#project-description)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [ETL Process Details](#etl-process-details)
  - [Step 1: Database Setup](#step-1-database-setup)
  - [Step 2: Extraction](#step-2-extraction)
  - [Step 3: Transformation](#step-3-transformation)
  - [Step 4: Load](#step-4-load)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Disclaimer](#disclaimer)
- [Author](#author)
- [License](#license)
---
## Overview
This project demonstrates an **ETL (Extract, Transform, Load) process** that extracts JSON data from a file, transforms it into a relational format using SQL Server capabilities, and loads the data into an existing SQL database. It effectively integrates data for teams and players into the database while enforcing data integrity via primary and foreign key constraints.

## Project Description
The repository contains SQL scripts that perform the following:
- **Extraction:** Read JSON data from an external file using the `OPENROWSET` function
- **Transformation:** Parse and structure the JSON data with `OPENJSON`, including handling nested data (i.e., players array)
- **Loading:** Insert the transformed data into existing tables (`team` and `player`) within a SQL Server database
- **Data Integrity:** Define and enforce primary and foreign key constraints to maintain relational integrity

## Prerequisites
- **SQL Server:** The scripts are written for Microsoft SQL Server
- **JSON Data File:** Ensure that the JSON file (e.g., `lab3_data.json`) is available at the specified location (default: `C:\data\lab3_data.json`). Adjust the file path in the SQL scripts if necessary
- **SQL Server Management Tools:** Use SQL Server Management Studio (SSMS) or a similar tool to execute the scripts
- **Permissions:** Sufficient privileges to create databases, tables, and perform data insertions
---
## Usage
1. Execute the SQL Scripts Sequentially:
   - First, run the database and table creation scripts to set up the working environment
   - Next, execute the ETL script to extract, transform, and load the JSON data into the database
   - Finally, verify the data integration by running simple SELECT queries against the team and player tables

2. Verify the Data: Once the process completes, check the database to ensure that the JSON data has been correctly merged. For example:
   ```sql
   SELECT * FROM team;
   SELECT * FROM player;
---

## Execution:
1. Database Setup:
  - Database Creation: The script drops any existing lab4_db database and creates a new one to ensure a clean environment
  - Table Creation: Two tables, team and player, are created with a specified schema. Primary keys are defined, and a foreign key in the player table references the team table

2. Extraction:
  - Extracting JSON Data: The OPENROWSET function is used to read the entire JSON file as a single CLOB. This initial extraction ensures that the file's contents are available for further processing

3. Transformation:
  - Parsing JSON Data: The JSON content is parsed using OPENJSON to extract individual team records. A temporary table (#temp_team) is then built to hold the intermediate data
  - Handling Nested Data (Players): The players array within the JSON is further parsed and stored in a temporary table (json_temp_player) to facilitate a smooth transformation into the relational structure

4. Load:
  - Inserting Transformed Data: The transformed data is inserted into intermediate tables (json_team and json_player) with necessary modifications such as enforcing NOT NULL on key columns
  - Merging with Existing Data: The SQL scripts then load the JSON data into the existing team and player tables
  - To preserve primary key values, IDENTITY_INSERT is used during the insert operations
---

## Project Structure

├── README.md                # This file
├── lab3_data.json           # JSON file containing team and player data
└── SQL_Scripts/
    ├── create_database.sql  # Scripts for database and table creation
    └── etl_process.sql      # Scripts for extracting, transforming, and loading JSON data


## Installation
Clone the Repository:
```bash
git clone https://github.com/Guber430/ETL-Process-for-Adding-JSON-data-to-SQL-Database.git
cd ETL-Process-for-Adding-JSON-data-to-SQL-Database
