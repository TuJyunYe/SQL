/*
having 子句能夠過濾條件，控制哪些組可以出現在最後結果中。
*/
select o.ProductID, p.ProductName, sum(o.Quantity * p.Price) total
from orders.orderdetails o, orders.products p
where o.ProductID = p.ProductID
group by o.ProductID
having total > 500
order by total desc;