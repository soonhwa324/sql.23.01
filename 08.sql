select employee_id, job_id
from employees
union-- 2���� ���� ��ģ��(�ߺ�����), table�� ������ ���ƾ��Ѵ�, ������ Ÿ���� ���ƾ��Ѵ�
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history
order by employee_id;

-- ����: ���� ������ ���� ���� �ִ� ������� ���, �̸�, ������ ��ȸ�϶�.
select department_id, last_name, job_id
from employees e
where exists (select * 
                from job_history j
                where e.employee_id = j.employee_id
                    and e.job_id = j.job_id);
                    
select department_id, last_name, job_id
from employees e
where e.job_id in (select job_id
                    from job_history j
                    where e.employee_id = j.employee_id);
                    
select e.employee_id, e.last_name, e.job_id
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id;

select location_id, department_name
from departments
union
select location_id, state_province
from locations;

--����: �� ������ service �������� ���Ķ�.
--      union �� ����Ѵ�.
select location_id, department_name, null state
from departments
union 
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by salary;