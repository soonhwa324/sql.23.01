select avg(salary), max(salary), min(salary), sum(salary)
from employees;

select min(hire_date), max(hire_date)
from employees;

--과제: 최고월급과 최소월급의 차액을 조회하라.
select max(salary) - min(salary)
from employees;

select count(*)
from employees;

--과제: 70번 부서원이 몇명인지 조회하라.
select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

select count(manager_id)
from employees;
--영엽사원들의 평균 커미션
select avg(commission_pct)
from employees;

--과제: 조직의 평균 커미션율을 조회하라.
select avg(nvl(commission_pct, 0))
from employees;

select avg(salary)
from employees;
--중복제거
select avg(distinct salary)
from employees;

--과제: 직원이 배치된 부서 개수를 조회하라.
select count(distinct department_id)
from employees;

--과제: 매니저 수를 조회하라
select count(distinct manager_id)
from employees;
--select에 칼럼 네임이 등장하면 group by 써야함
select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id, job_id
order by department_id;

--과제: 직업별 사원수를 조회하라.
select job_id, count(employee_id)
from employees
group by job_id;
--having group by 의 조건문 
select department_id, max(salary)
from employees
group by department_id
having department_id > 50;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;
--별명은 못알아먹는다
select department_id, max(salary) max_sal
from employees
group by department_id
having max_sal > 10000;

select department_id, max(salary)
from employees
where department_id > 50
group by department_id;
--where 는 그룹함수 못써  조건에 group 쓰고싶으면 having 써,
select department_id, max(salary)
from employees
where max(salary) > 10000
group by department_id;
--문법 종합
select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;

-- 과제: 매니저ID, 매니저별 관리 직원들중 최소월급
--     최소월급이 $6,000 초과여야한다.
select manager_id , min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

select sum(max(avg(salary)))
from employees
group by department_id;
--부서 최대 월급자들의 평균 , group function 은 2단계까지 쓸수있다. 오류코드
select department_id, round(avg(salary))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees;
-- 오류코드
-- 과제: 2001년, 2002년, 2003년도별 입사자 수를 조회하라.
select to_char(hire_date, 'yyyy') hire_year, count(*) emp_cnt
from employees
where to_char(hire_date, 'yyyy') in (2001, 2002, 2003)
group by to_char(hire_date, 'yyyy')
order by hire_year;


select sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002' , 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

select count(case when hire_date like '2001%' then 1 else null end) "2001",
    count(case when hire_date like '2002%' then 1 else null end) "2002",
    count(case when hire_date like '2003%' then 1 else null end) "2003"
from employees;

-- 과제: 직업별, 부서별 월급합을 조회하라.
--       부서는 20, 50, 80 이다.
select job_id, sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80"
from employees
group by job_id;