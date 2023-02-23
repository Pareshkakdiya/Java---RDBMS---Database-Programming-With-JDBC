 SELECT * FROM java_11.edata;
 use java_11;
 -- 2.List the details of the emps in asc order of the Dptnos and desc of Jobs? --
 select * from edata order by Deptno;
 select * from edata order by Job;
--  Display all the unique job groups in the descending order?
select * from edata order by Job desc;
--  List the emps who joined before 1981.
select * from edata where Hiredate<"1981-01-01";
-- List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select Eno,Ename,Sal from edata order by Sal asc;
--  List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369. 
select Eno,Ename,Sal from edata where Mgr>=7369;
-- Display all the details of the emps who’s Comm. Is more than their Sal? 
select * from edata where comm>Sal;
-- List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order. 
select * from edata where Job = "CLERK" OR Job = "ANALYST" order by Ename desc;
--  List the emps Who Annual sal ranging from 22000 and 45000. 
select * from edata where Sal*12>22000 and Sal*12<45000;
-- List the Enames those are starting with ‘S’ and with five characters. 
select * from edata where Ename like 'S____';
-- List the emps whose Empno  starting with digit78. 
select * from edata where Eno like '78__';
-- List the emps whose Empno  starting with digit78. 
select * from edata where Eno not like '78%';
-- List all the Clerks of Deptno 20. 
select * from edata where Deptno = 20 and Job = "CLERK";
--  List the Emps who are senior to their own MGRS. 
select * from edata where Eno > Mgr;
-- List the Emps of Deptno 20 who’s Jobs are same as Deptno10. 
select * from edata where Deptno = 20 and Job in (select Job from edata where Deptno = 10) union
select * from edata where Deptno = 10 and Job in (select Job from edata where Deptno = 20);
-- List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal. 
select * from edata where Sal in (select Sal from edata where Ename = "FORD" or Ename = "SMITH") order by Sal desc;
-- List the emps whose jobs same as SMITH or ALLEN.
select * from edata where Job in (select Job from edata where Ename = "SMITH" OR Ename = "ALLEN");
-- Any jobs of deptno 10 those that are not found in deptno 20. 
select * from edata where Deptno = 10 and Job not in (select Job from edata where Deptno = 20); 
-- Find the highest sal of EMP table. 
select max(Sal) from edata;
--  Find details of highest paid employee. 
select * from edata where Sal in (select max(Sal) from edata);
--  List the emps whose names contains ‘A’. 
select * from edata where Ename like '%A%';
-- Find all the emps who earn the minimum Salary for each job wise in ascending order. 
select * from edata where Sal in (select min(Sal) from edata group by Job);
-- List the emps whose sal greater than Blake’s sal.
select Ename,Sal from edata where Sal > 2850.00;
-- Create view v1 to select ename, job, dname, loc whose deptno are same.
select e.Ename,e.Job,d.Dname,d.Loc from edata e join depttable d on e.Deptno = d.Deptno;
