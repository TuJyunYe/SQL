# 請在table orders中，搜尋CustomerId = 87，同時ShipperId = 3的資料
select *
from orders.orders
where CustomerID = 87 && ShipperID = 3;