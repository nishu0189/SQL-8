/*
Benefits of Using Views:-
1. Simplified Access or easy to share: Users can fetch summarized data easily.
2. Reusability: You don't need to rewrite the query every time.
3. Abstraction: It hides the complexity of the underlying query.
*/
--view can be create of any query.... it is not holding any data

-------------------------------------------------------VIEW-----------------------------------------------------
create view  order_vw as  --view CREATE
select * from orders       --query(to select all data of orders)

select * from order_vw        --view RUN

----------------------------------------ACCESS THE TABLE FROM DIFF DATABASE ------------------------------------

SELECT * from master.dbo.bank;  --if bank is table of master and you are now on namaste sql

--------create a view so that reference table of master store as a view of 
create view bank_master_vw as
SELECT * from master.dbo.bank;

--------------------------------------------------REFERENCE---------------------------------------------

--it basically show that value of col of emp table should that value to be present in the dept val
/* 1. A reference constraint is used to establish a relationship between two tables, eg:- emp , dept table
ensuring that the values in one table refer to values in another table
2.  This type of constraint is commonly referred to as a foreign key constraint.
and col of dept should be primary key.      */

create table dept2(dept_id int primary key, dept_name varchar(20));

INSERT INTO dept2 (dept_id, dept_name)
VALUES
(100, 'HR'),
(200, 'IT'),
(300, 'Finance'),
(400, 'Marketing'),
(500, 'Sales');


create table emp2(emp_id int, name varchar(20), dept_id int references dept2(dept_id));-- references only apply when dept2 dept_id is primary key

INSERT INTO emp2 (emp_id, name, dept_id) 
VALUES (1, 'John Doe', 200)  --nor issue as 200 is in dept2 table 


INSERT INTO emp2 (emp_id, name, dept_id)    -- XXXX this show the ERRORRR as it conflict there is no 900 dept_id in dept2 table
VALUES (2, 'Sarah Davis', 900)


INSERT INTO emp2 (emp_id, name, dept_id)    -- but null can be run as it not a value, it is null
VALUES (2, 'Rani', null) 

Delete      --OR update
from dept2 
where dept_id = 200;               --XXX it show error bcz we cant delete as it exist in emp2 already


------------------------------------------------FOREIGN CONSTRAINT-----------------------------------------------------------

/* FOREIGN KEY is the constraint, and REFERENCES is the clause that specifies the relationship.
1. It explicitly links a column in one table to the primary key in another table, ensuring referential integrity.
     dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept2(dept_id)
OR
2. REFERENCES :-
 dept_id INT REFERENCES dept2(dept_id)  */



--------------------------------------------------IDENTITY(1,1) ----------------------------------------------------

--  drop table emp3
create table emp3(id int identity(1,100),  --identity constraint for automatically increment..
name varchar(10),dept_id int)              --100 show first id will be 100 and after id is incrementof 1 

-- identity(100,1):- 100,101,102,103      LHS -> STARTING 
-- identity(1,100):- 1, 101,201,301       RHS -> INCREMENT 
-- identity(1,100):- 1,2,3,4,5

INSERT INTO emp3 (name, dept_id)
values('nishu',100),
('avi',200),
('ishu',500);

select * from emp3



