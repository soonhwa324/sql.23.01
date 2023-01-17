-- single funtion
desc dual
select * from dual;

select lower('SQL Course')
from dual;

select upper('SQL Course')
from dual;

select initcap('SQL Course')
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

select substr('Hello', -1, 1)
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

select replace('JACK and JUE', 'J', 'Bl')
from dual;

select trim('H' from 'Hello')
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--����:  �� query���� ' ' �� trim �ƽ���, ������ Ȯ���� �� �հ� ��ȸ�϶�.
select '|' || trim(' ' from ' Hello ') || '|'
from dual

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
    from employees
    where substr(job_id, 4) = 'PROG';
--����: �� query����, where ���� like �� refactoring �϶�.
select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';
