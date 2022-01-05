/*
請依據訂單明細(orderdetails)的資料，列出包含產品ID, 產品名稱與產品金額總和的報表。
報表結果請依據價格由高至低呈現。
*/
select o.ProductID, p.ProductName, sum(o.Quantity * p.Price) total
from orders.orderdetails o, orders.products p
where o.ProductID = p.ProductID
group by o.ProductID
order by total desc;