/*
between 可以找出一個範圍內的資料
between… and…
*/
select *
from orders.products
where Price between 1 and 100
order by Price desc;