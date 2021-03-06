------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

-- Drop the tables in case they exist

DROP TABLE EMPLOYEES;
DROP TABLE JOB_HISTORY;
DROP TABLE JOBS;
DROP TABLE DEPARTMENTS;
DROP TABLE LOCATIONS;

-- Create the tables

CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY ( 
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(15) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );

--Exercise
--Problem 1: Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
SELECT * FROM EMPLOYEES
WHERE SALARY < AVG(SALARY);

--Problem 2: Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

--Problem 3: Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES; 

--Problem 4: Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY
FROM EMPLOYEES; 

--Problem 5: Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
SELECT * FROM ( SELECT EMP_ID, F_NAME, L_NAME, DEP_ID FROM EMPLOYEES) AS EMP4ALL;
