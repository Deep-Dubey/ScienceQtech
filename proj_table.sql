CREATE TABLE IF NOT EXISTS `proj_table` (
    `PROJECT_ID` VARCHAR(4) CHARACTER SET utf8,
    `PROJ_NAME` VARCHAR(30) CHARACTER SET utf8,
    `DOMAIN` VARCHAR(10) CHARACTER SET utf8,
    `START_DATE` VARCHAR(10) CHARACTER SET utf8,
    `CLOSURE_DATE` DATETIME,
    `DEV_QTR` VARCHAR(2) CHARACTER SET utf8,
    `STATUS` VARCHAR(7) CHARACTER SET utf8
);
INSERT INTO `proj_table` VALUES ('P103','Drug Discovery','HEALTHCARE','04-06-2021','2021-06-20 00:00:00','Q1','DONE'),
	('P105','Fraud Detection','FINANCE','04-11-2021','2021-06-25 00:00:00','Q1','DONE'),
	('P109','Market Basket Analysis','RETAIL','04-12-2021','2021-06-30 00:00:00','Q1','DELAYED'),
	('P204','Supply Chain Management','AUTOMOTIVE','07/15/2021','2021-09-28 00:00:00','Q2','WIP'),
	('P302','Early Detection of Lung Cancer','HEALTHCARE','10-08-2021','2021-12-18 00:00:00','Q3','YTS'),
	('P406','Customer Sentiment Analysis','RETAIL','07-09-2021','2021-09-24 00:00:00','Q2','WIP');
