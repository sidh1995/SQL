CREATE TABLE employee(
   employee_id INTEGER  NOT NULL PRIMARY KEY 
  ,last_name   VARCHAR(8) NOT NULL
  ,first_name  VARCHAR(8) NOT NULL
  ,title       VARCHAR(22) NOT NULL
  ,reports_to  INTEGER 
  ,levels      VARCHAR(2) NOT NULL
  ,birthdate   VARCHAR(16) NOT NULL
  ,hire_date   VARCHAR(16) NOT NULL
  ,address     VARCHAR(27) NOT NULL
  ,city        VARCHAR(10) NOT NULL
  ,state       VARCHAR(2) NOT NULL
  ,country     VARCHAR(6) NOT NULL
  ,postal_code VARCHAR(7) NOT NULL
  ,phone       VARCHAR(17) NOT NULL
  ,fax         VARCHAR(17) NOT NULL
  ,email       VARCHAR(27) NOT NULL
);
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (1,'Adams','Andrew','General Manager',9,'L6','18-02-1962 00:00','14-08-2016 00:00','11120 Jasper Ave NW','Edmonton','AB','Canada','T5K 2N1','+1 (780) 428-9482','+1 (780) 428-3457','andrew@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (2,'Edwards','Nancy','Sales Manager',1,'L4','08-12-1958 00:00','01-05-2016 00:00','825 8 Ave SW','Calgary','AB','Canada','T2P 2T3','+1 (403) 262-3443','+1 (403) 262-3322','nancy@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (3,'Peacock','Jane','Sales Support Agent',2,'L1','29-08-1973 00:00','01-04-2017 00:00','1111 6 Ave SW','Calgary','AB','Canada','T2P 5M5','+1 (403) 262-3443','+1 (403) 262-6712','jane@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (4,'Park','Margaret','Sales Support Agent',2,'L1','19-09-1947 00:00','03-05-2017 00:00','683 10 Street SW','Calgary','AB','Canada','T2P 5G3','+1 (403) 263-4423','+1 (403) 263-4289','margaret@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (5,'Johnson','Steve','Sales Support Agent',2,'L1','03-03-1965 00:00','17-10-2017 00:00','7727B 41 Ave','Calgary','AB','Canada','T3B 1Y7','1 (780) 836-9987','1 (780) 836-9543','steve@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (6,'Mitchell','Michael','IT Manager',1,'L3','01-07-1973 00:00','17-10-2016 00:00','5827 Bowness Road NW','Calgary','AB','Canada','T3B 0C5','+1 (403) 246-9887','+1 (403) 246-9899','michael@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (7,'King','Robert','IT Staff',6,'L2','29-05-1970 00:00','02-01-2017 00:00','590 Columbia Boulevard West','Lethbridge','AB','Canada','T1K 5N8','+1 (403) 456-9986','+1 (403) 456-8485','robert@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (8,'Callahan','Laura','IT Staff',6,'L2','09-01-1968 00:00','04-03-2017 00:00','923 7 ST NW','Lethbridge','AB','Canada','T1H 1Y8','+1 (403) 467-3351','+1 (403) 467-8772','laura@chinookcorp.com');
INSERT INTO employee(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email) VALUES (9,'Madan','Mohan','Senior General Manager',NULL,'L7','26-01-1961 00:00','14-01-2016 00:00','1008 Vrinda Ave MT','Edmonton','AB','Canada','T5K 2N1','+1 (780) 428-9482','+1 (780) 428-3457','madan.mohan@chinookcorp.com');
