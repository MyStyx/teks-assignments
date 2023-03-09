create database hrdb;
use hrdb;

create table hremployee(
employeeid int,
department varchar(30),
jobrole varchar(30),
attrition varchar(5),
gender varchar(10),
age int,
maritalstatus varchar(10),
education varchar(20),
educationfield varchar(20),
businesstravel varchar(20),
jobinvolved varchar(10),
joblevel int,
jobsatisfaction varchar(10),
hourlyrate int,
income int,
salaryhike int,
overtime varchar(5),
workex int,
yearssincelastpromotion int,
empsatisfaction varchar(10),
trainingtimeslastyear int,
worklifebalance varchar(10),
performancerating varchar(20));

select * from hremployee;

-- Q2

select(
select count(*)
from information_schema.columns t1 where table_name = 'hremployee')
as No_of_columns,
count(*) as No_of_rows from hremployee;

-- Q3

select department, count(*) as total, count(*) * 100 /(select count(*) from hremployee) as perc 
from hremployee as sm group by department;

-- Q4

select department,
count(if (gender = 'male', 1, null)) as male,
count(if (gender = 'female', 1, null)) as female
from hremployee
group by department;

-- Q5

select jobrole, count(jobrole) as workforce
from hremployee group by jobrole;

-- Q6 

select 
count(if (age <= 20, 1, null)) as '<20',
count(if (age >= 20 and age < 30, 1, null)) as '20-30',
count(if (age >= 30 and age < 40, 1, null)) as '30-40',
count(if (age >= 40 and age < 50, 1, null)) as '40-50',
count(if (age >= 50, 1, null)) as '50+'
from hremployee;

-- Q7

select maritalstatus, count(maritalstatus) as m_status
from hremployee group by maritalstatus
order by m_status desc;

-- Q8

select jobsatisfaction, count(jobsatisfaction) as job_satis_count from hremployee
group by jobsatisfaction order by job_satis_count desc;

-- Q9

select businesstravel, count(businesstravel) as travel_count from hremployee
group by businesstravel order by travel_count desc;

-- Q10

select department, count(department) as attrition_count,
count(department) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by department order by attrition_count desc;

-- Q11

select jobrole, count(jobrole) as attrition_count,
count(jobrole) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by jobrole order by attrition_count desc;

-- Q12

alter table hremployee
add column promo_group varchar(10);
update hremployee
set promo_group=if(yearssincelastpromotion<=5, '0-5', if(yearssincelastpromotion<=10,'6-10', '11-15'));
select promo_group, count(*) as promo_count,
count(*)*100/(select count(*) from hremployee) as count_perc
from hremployee
group by promo_group
order by count_perc; 

-- Q13

select maritalstatus, count(maritalstatus) as attrition_count,
count(maritalstatus) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by maritalstatus order by attrition_count desc;

-- Q14

select education, count(education) as attrition_count,
count(education) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by education order by attrition_count desc;

-- Q15

select businesstravel, count(businesstravel) as attrition_count,
count(businesstravel) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by businesstravel order by attrition_count desc;

-- Q16

select jobinvolved, count(jobinvolved) as attrition_count,
count(jobinvolved) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by jobinvolved order by attrition_count desc;

-- Q17

select jobsatisfaction, count(jobsatisfaction) as attrition_count,
count(jobsatisfaction) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by jobsatisfaction order by attrition_count desc;

-- Q18

create view marital_attr_view as
select maritalstatus, count(maritalstatus) as attrition_count,
count(maritalstatus) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by maritalstatus order by attrition_count desc limit 1;

create view edu_attr_view as
select education, count(education) as attrition_count,
count(education) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by education order by attrition_count desc limit 1;

create view busstrav_attr_view as
select businesstravel, count(businesstravel) as attrition_count,
count(businesstravel) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by businesstravel order by attrition_count desc limit 1;

create view jobinv_attr_view as
select jobinvolved, count(jobinvolved) as attrition_count,
count(jobinvolved) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by jobinvolved order by attrition_count desc limit 1;

create view jobsatis_attr_view as
select jobsatisfaction, count(jobsatisfaction) as attrition_count,
count(jobsatisfaction) * 100 / (select count(*) from hremployee where attrition = 'Yes') as attrition_perc
from hremployee
where attrition = 'yes'
group by jobsatisfaction order by attrition_count desc limit 1;

select * from marital_attr_view
cross join edu_attr_view
cross join busstrav_attr_view
cross join jobinv_attr_view
cross join jobsatis_attr_view;

-- Q19

select * from hremployee where
workex > 10 and
businesstravel = 'Travel_Frequently' and
worklifebalance = 'Good' and
jobsatisfaction = 'Very High';

-- Q20

select * from hremployee 
where performancerating = 'Outstanding'
and worklifebalance = 'Better'
group by maritalstatus;