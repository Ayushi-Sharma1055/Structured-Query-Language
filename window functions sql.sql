create database window1;
use window1;
create table window0 (new_id int,new_cat varchar(20));
insert into window0 (new_id,new_cat) values(100,"agni"),(200,"agni"),(500,"dharti"),(700,"dharti"),(200,"vayu"),(300,"vayu"),(500,"vayu");
select * from window0;

select new_id,new_cat,
sum(new_id)over(partition by new_cat) as "total" from window0;


select new_id,new_cat,
max(new_id)over(partition by new_cat) as "max" from window0;


select new_id,new_cat,
min(new_id)over(partition by new_cat) as "min" from window0;


select new_id,new_cat,
count(new_id)over(partition by new_cat) as "count" from window0;


select new_id,new_cat,
avg(new_id)over(partition by new_cat) as "avg" from window0;


select new_id,new_cat,
sum(new_id)over(partition by new_cat) as "total",
max(new_id)over(partition by new_cat) as "max",
min(new_id)over(partition by new_cat) as "min",
count(new_id)over(partition by new_cat) as "count",
avg(new_id)over(partition by new_cat) as "avg"from window0;


select new_id,new_cat,
sum(new_id)over(order by new_id) as "total",
max(new_id)over(order by new_id) as "max",
min(new_id)over(order by new_id) as "min",
count(new_id)over(order by new_id) as "count",
avg(new_id)over(order by new_id) as "avg"from window0;


select new_id,new_cat,
row_number() over (order by new_id) as "row number",
rank() over (order by new_id) as "rank",
dense_rank() over(order by new_id) as "dense number",
percent_rank() over(order by new_id) as "percent rank" from window0;



#analytic
select new_id,
first_value(new_id) over(order by new_id) as "first value" from window0;


select new_id,
lead(new_id) over(order by new_id) as "lead",
lag(new_id) over( order by new_id) as "lag" from window0;
