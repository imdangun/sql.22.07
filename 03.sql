-- single function

desc dual
select * from dual;

select lower('SQL Course')
from dual;

select upper('SQL Course')
from dual;

select initcap('SQL course')
from dual;

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';

select concat('Hello', 'World')
from dual;

select substr('HelloWorld', 2, 5)
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l')
from dual;
select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees;
select rpad(salary, 5, '*')
from employees;

select replace('JACK and JUE', 'J', 'BL')
from dual;

select trim('H' from 'Hello')
from dual;
select trim('l' from 'Hello')
from dual;
select trim(' ' from ' Hello ')
from dual;
--과제] 위 query에서 ' '가 trim 됐음을, 눈으로 확인할 수 있게 조회하라.
