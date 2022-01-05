# 將 orders 與 customer 兩個 table 作結合。
select *
from orders.orders o, orders.customers c
where o.CustomerID = c.CustomerID;