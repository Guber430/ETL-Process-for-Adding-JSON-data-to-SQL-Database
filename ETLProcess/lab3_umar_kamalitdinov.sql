-- =============================================
-- Author: Umar Kamalitdinov
-- Create date: 08.08.2024
-- Course: PROG 1870
-- Description: Lab 3
-- Disclaimer: This project is for educational purposes only.
-- =============================================

USE tempdb;
GO
DROP DATABASE IF EXISTS lab4_db;
GO
CREATE DATABASE lab4_db;
GO
USE lab4_db;
GO
EXEC sp_changedbowner 'sa';
GO

CREATE TABLE team(
	teamId			INT IDENTITY(1, 1),
	teamName		VARCHAR(25),
	teamCity		VARCHAR(35),
	teamRank		TINYINT,
	teamActive		BIT,
	teamManager		VARCHAR(20),
	teamManagerCity	VARCHAR(35),
	teamFormedDate	DATE,
	CONSTRAINT pk_team_teamId PRIMARY KEY (teamId)
);
INSERT INTO team
VALUES
	('Cha Cha Cha',			'Thorold',				5,	1,	'Sandy Smith',		'Toronto',			'2022-01-24'),
	('Cool Sky Flower',		'Niagara Falls',		4,	1,	'Sophie Willow',	'Welland',			'2021-04-30'),
	('Creamy Pointy',		'Niagara Falls',		1,	1,	'Katie Lee',		'Throld',			'2022-01-08'),
	('Cute Shark',			'Toronto',				1,	1,	'Jack Sanderson',	'St Cathrines',		'2021-12-18'),
	('Dot Dot Business',	'Niagara-on-the-Lake',	2,	1,	'Tom King',			'Thorold',			'2021-10-30'),
	('Easy Creep',			'Welland',				3,	0,	'Nancy Boulter',	'Regina',			'2021-03-16'),
	('Green Power',			'Thorold',				2,	0,	'Jackie Smith',		'Welland',			'2020-09-30'),
	('Squat Star Power',	'St Catharines',		4,	1,	'Steve Jenkins',	'Niagara Falls',	'2021-02-26'),
	('Smart Cholestoral',	'Grimysby',				2,	1,	'Frank King',		'Thorold',			'2020-08-31'),
	('Zig Zag Torpedo',		'Hamilton',				1,	0,	'Gilbert Wolfe',	'NOTL',				'2020-12-02');


CREATE TABLE player(
	playerId			INT IDENTITY(1, 1),
	playerUserId		VARCHAR(20),
	playerTitle			VARCHAR(15),
	playerFirstName		VARCHAR(25) NOT NULL,
	playerLastName		VARCHAR(30) NOT NULL,
	playerQuizDate		DATE,
	playerStreet		VARCHAR(35),
	playerCity			VARCHAR(40),
	playerProvince		VARCHAR(45),
	playerPhone			CHAR(10),
	playerIsVideoGame	BIT,
	playerIncome		DECIMAL(12, 2),
	teamId INT,
	CONSTRAINT pk_player_playerId PRIMARY KEY (playerId),
	CONSTRAINT fk_player_team FOREIGN KEY (teamId) REFERENCES team (teamId) ON DELETE SET NULL
);
INSERT INTO player
VALUES
	('Amelia_Ray',			'Ms',	'Amelia',		'Ray',			'2020-09-07',	'4198 James Street',	'St Catharines',	'Ontario',			'9056825216',	1,		100378.38,	2),
	('David_Herd',			'Mr',	'David',		'Herd',			'2020-09-13',	'1843 St. Paul Street',	'Niagara Falls',	'Ontario',			'9053711255',	1,		99568.88,	10),
	('Mike_Slavinjak',		'Mr',	'Mike',			'Slavinjak',	'2020-09-24',	'29 Palace Street',		'Niagara Falls',	'Ontario',			'9053741378',	1,		123862.79,	3),
	('Merrill_Choudhry',	'Mr',	'Merrill',		'Choudhry',		'2020-10-06',	'4765 Maria St',		'Burlington',		'Ontario',			'9056399996',	1,		99896.16,	4),
	('Sophia_Wardle',		'Miss',	'Sophia',		'Wardle',		'2020-10-08',	'1844 Ontario St',		'St Catharines',	'Ontario',			'9056461165',	1,		139638.57,	4),
	('Mia_Ho',				'Miss',	'Mia',			'Ho',			'2020-10-09',	'22 Gracefield Avenue',	'Thorold',			'Ontario',			'9053542704',	1,		79698.98,	7),
	('Charlotte_Nijjar',	'Mrs',	'Charlotte',	'Nijjar',		'2021-01-24',	'4012 St. Paul Street',	'St Catharines',	'Ontario',			'9053589981',	1,		86397.28,	9),
	('Ryan_Li',				'Mr',	'Ryan',			'Li',			'2021-02-27',	'658 Rose Street',		'Regina',			'Saskatchewan',		'3065459237',	1,		178651.39,	4),
	('Emma_Houle',			'Ms',	'Emma',			'Houle',		'2021-02-27',	'1365 Weir Crescent',	NULL,				NULL,				'9056320269',	1,		96872.56,	4),
	('Olivia_Maas',			'Miss',	'Olivia',		'Maas',			'2021-03-27',	'734 James Street',		'St Catharines',	'Ontario',			'9053359062',	1,		123987.68,	4),
	('Darren_Muetz',		'Mr',	'Darren',		'Muetz',		'2021-04-19',	'717 Ontario St',		'Toronto',			'Ontario',			'9058023124',	1,		121268.37,	5),
	('Nancy_Combe',			'Mrs',	'Nancy',		'Combe',		'2021-09-13',	'63 Adelaide St',		'Toronto',			'Ontario',			'4169806097',	1,		89637.36,	6),
	('Stephen_Shock',		'Mr',	'Stephen',		'Shock',		'2021-10-18',	'48 George ST',			'Thorold',			'Ontario',			'9056390805',	0,		99965.23,	8),
	('Julianna_Smith',		'Mrs',	'Julianna',		'Smith',		'2021-10-21',	NULL,					'Niagara Falls',	'Ontario',			'6478696345',	1,		116872.63,	8),
	('Ava_Creamer',			'Mrs',	'Ava',			'Creamer',		'2022-01-06',	'213 Barton Street',	'Hamilton',			'Ontario',			'4164912619',	1,		110268.37,	NULL),
	('Kyle_Edwards',		'Mr',	'Kyle',			'Edwards',		'2022-01-07',	'3393 Maria St',		'St Catharines',	'ON',				'6472975094',	1,		98365.29,	NULL);

SELECT * FROM team;
SELECT * FROM player;


--STEP 1.	extract json file (lab3_data.json) using OPENROWSET
SELECT BulkColumn
FROM OPENROWSET(BULK 'C:\data\lab3_data.json', SINGLE_CLOB) AS x;
GO

--STEP 2.	transform extracted data
--	2.1.	OPENROWSET CROSS APPLY OPENJSON
SELECT * 
FROM OPENROWSET(BULK 'C:\data\lab3_data.json', SINGLE_CLOB) AS x
	CROSS APPLY OPENJSON(BulkColumn);
GO

--	2.2.	create a #temp_team table using CTAS for loading
SELECT y.*
INTO #temp_team
FROM OPENROWSET(BULK N'C:\data\lab3_data.json', SINGLE_CLOB) AS x
	CROSS APPLY OPENJSON(BulkColumn)
		WITH
		(	teamId				INT				'$.team_id',
			teamName			VARCHAR(25)		'$.name',
			teamCity			VARCHAR(35)		'$.city',
			teamRank			TINYINT			'$.rank',
			teamActive			BIT				'$.active',
			teamManager			VARCHAR(20)		'$.manager_name',
			teamManagerCity		VARCHAR(35)		'$.manager_city',
			teamFormedDate		DATE			'$.formed_date',			
			players	NVARCHAR(MAX) AS JSON  
		) AS y;
GO

--STEP 3.	load transformed data into rdb tables
--	3.1.	a). create team table
SELECT 
	teamId, 
	teamName, 
	teamCity,
	teamRank, 
	teamActive, 
	teamManager, 
	teamManagerCity, 
	teamFormedDate
INTO json_team
FROM #temp_team;
GO

--			b). set teamId to be NOT NULL, so it can be set as pk
ALTER TABLE		json_team
ALTER COLUMN	teamId INT NOT NULL;
GO

--			c). add pk constraint
ALTER TABLE json_team
ADD			CONSTRAINT pk_json_team_teamId PRIMARY KEY (teamId);
GO

--	3.2.		
--			a). create a player table
SELECT z.*, y.teamId
INTO json_temp_player
FROM #temp_team AS y
	CROSS APPLY OPENJSON(players)
		WITH
		(	playerId			INT				'$.player_id',
			playerUserId		VARCHAR(20)		'$.user_id',
			playerTitle			VARCHAR(15)		'$.title',
			playerFirstName		VARCHAR(25)		'$.first_name',
			playerLastName		VARCHAR(30)		'$.last_name',
			playerQuizDate		DATE			'$.quiz_date',
			playerStreet		VARCHAR(35)		'$.street',
			playerCity			VARCHAR(40)		'$.city',
			playerProvince		VARCHAR(45)		'$.province',
			playerPhone			CHAR(10)		'$.phone',
			playerIsVideoGame	BIT				'$.is_video_game',
			playerIncome		DECIMAL(12, 2)	'$.income'
		) AS z;
GO

SELECT 
	playerId,			
	playerUserId,		
	playerTitle,		
	playerFirstName,
	playerLastName,		
	playerQuizDate,		
	playerStreet,		
	playerCity,			
	playerProvince,		
	playerPhone,			
	playerIsVideoGame,	
	playerIncome,
	teamId
INTO json_player
FROM json_temp_player;
GO

--			b). set playerId to be NOT NULL, so it can be set as pk
ALTER TABLE		json_player
ALTER COLUMN	playerId INT NOT NULL;
GO

--			c). add pk and fk constraints
ALTER TABLE json_player
ADD			CONSTRAINT pk_json_player_playerId PRIMARY KEY (playerId),
			CONSTRAINT fk_json_player_team FOREIGN KEY (teamId) REFERENCES team (teamId);
GO


--STEP 4.	join the json data tables to the existing tables
--	4.1.	join the json team table to the existing table
SET IDENTITY_INSERT team ON;	--To set primary key column values

INSERT INTO 
	team (	teamId, 
			teamName, 
			teamCity,
			teamRank, 
			teamActive, 
			teamManager, 
			teamManagerCity, 
			teamFormedDate
		 )
SELECT 
	teamId, 
	teamName, 
	teamCity,
	teamRank, 
	teamActive, 
	teamManager, 
	teamManagerCity, 
	teamFormedDate 
FROM 
	json_team;
GO

SET IDENTITY_INSERT team OFF;
GO

--	4.2.	join the json player table to the existing table
SET IDENTITY_INSERT player ON;
GO

INSERT INTO
	player	(	playerId,
				playerUserId,
				playerTitle,
				playerFirstName,
				playerLastName,
				playerQuizDate,
				playerStreet,
				playerCity,
				playerProvince,
				playerPhone,		
				playerIsVideoGame,
				playerIncome,
				teamId
			)
SELECT
	playerId,
	playerUserId,
	playerTitle,
	playerFirstName,
	playerLastName,
	playerQuizDate,
	playerStreet,
	playerCity,
	playerProvince,
	playerPhone,		
	playerIsVideoGame,
	playerIncome,
	teamId
FROM 
	json_player;
GO

SET IDENTITY_INSERT player OFF;
GO

--SELECT * FROM team;
--SELECT * FROM player;