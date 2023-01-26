select hire_date
from employees
where hire_date = '2003/06/17';

select salary
from employees
where salary = '7000';

select hire_date || ''
from employees;

select salary || ''
from employees;

select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)')
from dual;

select to_char(sysdate, 'd')
from dual;

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

--과제: 위 테이블을 월요일부터 입사일 순으로 오름차순 정렬하라
select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY')
from employees;

--과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--      인사평가일은 입사한 지 3개월 후 첫번쨰 월요일이다.
--      날짜는 YYYY.MM.DD 로 표시한다.select to_char(sysdate, 'yyyy-mm-dd')
select last_name, hire_date, to_char(hire_date, 'YYYY.MM.DD') hire_date,
    to_char(next_day(add_months(hire_date, 3), 'MONDAY'), 'YYYY.MM.DD') review_date
from employees;

select to_char(salary)
from employees;

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';

select '|' || to_char(12.12, '9999.99') || '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99') || '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999')
from dual;

--과제: <이름> erans <$,월급> monthly but wants <$, 월급 x 3>. 로 조회하라
select last_name || ' earns' ||
    to_char(salary, 'fm$99,999') || 'monthly but wants ' ||
    to_char(salary * 3, 'fm$99,999') || '.'
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd, yyyy');

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy');

select to_number('1237')
from dual;

select to_number('1,234.12')
from dual;

select to_number('1,234.12', '9,999.99')
from dual;

select nvl(null, 0)
from dual;

select job_id, nvl(commission_pct, 0)
from employees;

--과제: 사원들의 이름, 직업, 연봉을 조회하라.
select last_name, job_id, salary * (1 + nvl(commission_pct, 0)) * 12
from employees;

--과제: 사원들의 이름, 커미션율을 조회하라.
--       커미션이 없으면, No Commisstion 을 표시한다.
select last_name, nvl(to_char(commission_pct), 'No Commisstion')
from employees;

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;


select job_id, nvl2(commission_pct, 'SAL+COMM', 0) income
from employees;
--두개의 파라미터값이 같으면 null 아니면 첫번째
select first_name, last_name,
    nullif(length(first_name), length(last_name))
from employees;

select to_char(null), to_number(null), to_date(null)
from dual;
--처음으로 null이 아닌값을 return
select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None')
from employees;

select last_name, salary,
    decode(trunc(salary / 2000),
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
            0.45) tax_rate
from employees
where department_id = 80;

select decode(salary, 'a' , 1)
from employees;

select decode(salary, 'a', 1, 0)
from employees;

select decode(job_id, 1, 1)
from employees;

--과제: 사원들의 직업, 직업별 등급을 조회하라.
--      기본등급은 null 이다
--      IT_PROG  A
--      AD_PRES  B
--      ST_MAN   C
--      ST_CLERK D
select job_id, decode(job_id,
    'IT_PROG', 'A',
    'AD_PRES', 'B',
    'ST_MAN' , 'C',
    'ST_CLERK','D' ) grade
from employees;

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'AD_PRES' then 1.05 * salary
    else salary end revised_salary
from employees;

select case job_id when '1' then 1
                    when '2' then 2
                    else 0
        end grade
from employees;

select case job_id when '1' then '1'
                    when '2' then '2'
                    else '0'
        end grade
from employees;
--기준값끼리 타입이 같고 리턴값끼리 타입이 같아야한다
select case salary when 1 then '1'
                    when 2 then '2'
                    else '0'
        end grade
from employees;
--베타적이다 하나가선택되면 버려짐
select last_name, salary,
    case when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'high'
        else 'good'
    end grade
from employees;

--과제: 사원들의 이름, 입사일, 입사요일을 월요일부터 요일순으로 조회하라.
select last_name, hire_date, to_char(hire_date, 'fmday') day
from employees
order by case day
            when 'monday' then 1
            when 'tuesday' then 2
            when 'wednesday' then 3
            when 'thursday' then 4
            when 'friday' then 5
            when 'saturday' then 6
            when 'sunday' then 7
        end;
        
--과제: 2005년 이전에 입사한사원들에게 100만원 상품권,
--      2005년 후에 입사한 사원들에게 10만원 상품권을지급한다.
--      사원들의 이름, 입사일, 상품권급액을 조회하라/\.
select last_name, hire_date, 
        case when hire_date <= '2005/12/31' then '1,000,000'
            else '100,000'
        end gift
from employees
order by gift, hire_date;