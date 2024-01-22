---question 3
--15612
select lpep_pickup_datetime::date , count(1)
from green_trip_data ytd 
where ytd.lpep_pickup_datetime::date = '2019-09-18'
and lpep_dropoff_datetime::date = '2019-09-18'
group by 1


---question 4
--2019-09-26	341.64
select lpep_pickup_datetime::date, max(trip_distance)
from green_trip_data gtd 
group by 1
order by 2 desc


--question 5
--Brooklyn
--Manhattan
--Queens
select zpul."Borough" as pu_borough, sum(total_amount)::int
from green_trip_data gtd 
join zones zpul on gtd."PULocationID" = zpul."LocationID" and zpul."Borough" != 'Unknown'
join zones zdol on gtd."DOLocationID" = zdol."LocationID"  and zdol."Borough" !='Unknown'
where gtd.lpep_pickup_datetime::date = '2019-09-18'
group by 1
order by 2 desc


--question 6
--JFK Airport
select zdol."Zone"  as do_zone, zpul."Zone" as pu_zone, tip_amount , *
from green_trip_data gtd 
join zones zpul on gtd."PULocationID" = zpul."LocationID" and zpul."Borough" != 'Unknown'
join zones zdol on gtd."DOLocationID" = zdol."LocationID"  and zdol."Borough" !='Unknown'
where zpul."Zone" = 'Astoria'
order by 3 desc 