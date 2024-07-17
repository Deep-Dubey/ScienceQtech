CREATE TABLE IF NOT EXISTS `data_science_team` (
    `EMP_ID` VARCHAR(4) CHARACTER SET utf8,
    `FIRST_NAME` VARCHAR(7) CHARACTER SET utf8,
    `LAST_NAME` VARCHAR(7) CHARACTER SET utf8,
    `GENDER` VARCHAR(1) CHARACTER SET utf8,
    `ROLE` VARCHAR(24) CHARACTER SET utf8,
    `DEPT` VARCHAR(10) CHARACTER SET utf8,
    `EXP` INT,
    `COUNTRY` VARCHAR(8) CHARACTER SET utf8,
    `CONTINENT` VARCHAR(13) CHARACTER SET utf8
);
INSERT INTO `data_science_team` VALUES ('E005','Eric','Hoffman','M','LEAD DATA SCIENTIST','FINANCE',11,'USA','NORTH AMERICA'),
	('E010','William','Butler','M','LEAD DATA SCIENTIST','AUTOMOTIVE',12,'FRANCE','EUROPE'),
	('E052','Dianna','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',6,'CANADA','NORTH AMERICA'),
	('E057','Dorothy','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',9,'USA','NORTH AMERICA'),
	('E204','Karene','Nowak','F','SENIOR DATA SCIENTIST','AUTOMOTIVE',8,'GERMANY','EUROPE'),
	('E245','Nian','Zhen','M','SENIOR DATA SCIENTIST','RETAIL',6,'CHINA','ASIA'),
	('E260','Roy','Collins','M','SENIOR DATA SCIENTIST','RETAIL',7,'INDIA','ASIA'),
	('E403','Steve','Hoffman','M','ASSOCIATE DATA SCIENTIST','FINANCE',4,'USA','NORTH AMERICA'),
	('E478','David','Smith','M','ASSOCIATE DATA SCIENTIST','RETAIL',3,'COLOMBIA','SOUTH AMERICA'),
	('E505','Chad','Wilson','M','ASSOCIATE DATA SCIENTIST','HEALTHCARE',5,'CANADA','NORTH AMERICA'),
	('E532','Claire','Brennan','F','ASSOCIATE DATA SCIENTIST','AUTOMOTIVE',3,'GERMANY','EUROPE'),
	('E620','Katrina','Allen','F','JUNIOR DATA SCIENTIST','RETAIL',2,'INDIA','ASIA'),
	('E640','Jenifer','Jhones','F','JUNIOR DATA SCIENTIST','RETAIL',1,'COLOMBIA','SOUTH AMERICA');
