-- view 
-- hr user
drop view empvu80;

create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;

desc empvu80

select * from empvu80;

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);

create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;

desc empvu80

-- 과제] 50번 부서원들의 사번, 이름, 부서번호로 만든 DEPT50 view 를 만들어라.
--      view 구조는 EMPNO, EMPLOYEE, DEPTNO 이다.
--      view 를 통해서 50번 부서 사원들이 다른 부서로 배치되지 않도록 한다.
create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;    

-- 과제] DEPT50 view 의 구조를 조회하라.
desc dept50

-- 과제] DEPT50 view 의 data 를 조회하라.
select * from dept50;
------------

drop table teams;
drop view team50;

create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;

create view team50 as
    select * 
    from teams
    where team_id = 50;

select * from team50;

select count(*) from teams;
insert into team50
values(300, 'Marketing');
select count(*) from teams;

create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;

insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support'); -- error, view WITH CHECK OPTION where-clause violation

create or replace view empvu10(employee_num, emplyee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;

insert into empvu10 values(501, 'abel', 'Sales'); -- error, cannot perform a DML
-------------------

drop sequence team_teamid_seq;

create sequence team_teamid_seq;

select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams 
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id = 3;

create sequence x_xid_seq
    start with 10
    increment by 5
    maxvalue 20
    nocache
    nocycle;

select x_xid_seq.nextval from dual; -- nocycle 효과를 경험한다.   

-- 과제] DEPT 테이블의 DEPARTMENT_ID 칼럼의 field value 로 사용할 sequence를 만들어라.
--      sequence 는 400 이상, 1000 이하로 생성한다. 10씩 증가한다.
create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;
    
-- 과제] 위 sequence 로, DEPT 테이블에 Education 부서를 insert 하라.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;
-------------------------

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select last_name, rowid
from employees;

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABK';

select index_name, index_type, table_owner, table_name
from user_indexes;

-- 과제] DETP 테이블의 DEPARTMENT_NAME 에 대해 index 를 만들어라.
create index dept_deptname_idx
on dept(department_name);
---------------------

drop synonym team;

create synonym team
for departments;

select * from team;

-- 과제] EMPLOYEES 테이블에 EMPS synonym 을 만들어라.
