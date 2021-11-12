---Revenue----
--create a revenue column for every day of the years--


with hotels as
(select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

select arrival_date_year, arrival_date_month,(stays_in_week_nights + stays_in_weekend_nights)* adr as Revenue 
from hotels


--Revenue by year--
---we would like to know the total revenue by each year ---


with hotels as
(select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])
select arrival_date_year, sum((stays_in_week_nights + stays_in_weekend_nights)* adr) as Revenue from hotels
group by arrival_date_year


--Revenue by hotel type--
--we would like to know which of our hotels makes the most revenue for each year by grouping the hotels--


with hotels as
(select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

select arrival_date_year, hotel,round( sum((stays_in_week_nights + stays_in_weekend_nights)* adr),2)as Revenue 
from hotels
group by arrival_date_year, hotel


--market segment
--we would like to analys our market segments or discounts of our found--


with hotels as
(select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

select * from hotels join dbo.market_segment
on hotels.market_segment = market_segment.market_segment


---meals ordered and meal cost for each day--

with hotels as
(select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

select * from hotels join dbo.market_segment
on hotels.market_segment = market_segment.market_segment
left join dbo.meal_cost
on meal_cost.meal = hotels.meal
