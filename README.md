# ETL Process for Adding JSON Data to SQL Database

## Table of Contents
- [Overview](#overview)
- [Project Description](#project-description)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [ETL Process Details](#etl-process-details)
  - [Step 1: Database Setup](#step-1-database-setup)
  - [Step 2: Extraction](#step-2-extraction)
  - [Step 3: Transformation](#step-3-transformation)
  - [Step 4: Load](#step-4-load)
- [Project Structure](#project-structure)
- [Disclaimer](#disclaimer)
- [Author](#author)
- [License](#license)

## Overview
This project demonstrates an **ETL (Extract, Transform, Load) process** that extracts JSON data from a file, transforms it into a relational format using SQL Server capabilities, and loads the data into an existing SQL database. It effectively integrates data for teams and players into the database while enforcing data integrity via primary and foreign key constraints.

## Project Description
The repository contains SQL scripts that perform the following:
- **Extraction:** Read JSON data from an external file using the `OPENROWSET` function.
- **Transformation:** Parse and structure the JSON data with `OPENJSON`, including handling nested data (i.e., players array).
- **Loading:** Insert the transformed data into existing tables (`team` and `player`) within a SQL Server database.
- **Data Integrity:** Define and enforce primary and foreign key constraints to maintain relational integrity.

## Prerequisites
- **SQL Server:** The scripts are written for Microsoft SQL Server.
- **JSON Data File:** Ensure that the JSON file (e.g., `lab3_data.json`) is available at the specified location (default: `C:\data\lab3_data.json`). Adjust the file path in the SQL scripts if necessary.
- **SQL Server Management Tools:** Use SQL Server Management Studio (SSMS) or a similar tool to execute the scripts.
- **Permissions:** Sufficient privileges to create databases, tables, and perform data insertions.

## Installation
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Guber430/ETL-Process-for-Adding-JSON-data-to-SQL-Database.git
   cd ETL-Process-for-Adding-JSON-data-to-SQL-Database
