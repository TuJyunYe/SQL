/*
and
or
not

請找出 products 表格中， categoryid 為 2 和 3 的資料，並且 price 介於 10 和 20 之間
*/

select *
from orders.products
where CategoryID in (2, 3)
and Price > 10
and Price < 20;