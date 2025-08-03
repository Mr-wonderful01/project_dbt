{{
    config(
        materialized='table'
    )
}}


with employee_raw as
(
    select 
       EMPID as emp_id,
       split_part(NAME, ' ', 1) as emp_first_name,
       split_part(NAME, ' ', 2) as emp_last_name,
       SALARY as emp_salary,
       HIREDATE as emp_hiredate,
       split_part(ADDRESS, ',', 1) as emp_house_number,
       split_part(ADDRESS, ',', 2) as emp_street,
       split_part(ADDRESS, ',', 3) as emp_city,
       split_part(ADDRESS, ',', 4) as emp_country,
       split_part(ADDRESS, ',', 5) as emp_zipcode,
    from {{source("emp_data", 'EMPLOYEE_RAW')}}
)

select * from employee_raw