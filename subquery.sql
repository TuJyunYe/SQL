/*
在一個 SQL 查詢敘述中，再放入另一個 SQL 查詢
子查詢（subquery）要用括弧包起來
在使用子查詢的時候也可以使用外部 SQL 的 TABLE 與欄位


使用 OrderDetails 的資料，查出訂單明細 ID 與產品名稱
在 SQL 中的 SELECT 放入子查詢，查詢產品名稱
*/
select o.OrderDetailID, 
	  (
       select p.ProductName
       from orders.products p
       where p.ProductID = o.ProductID
      ) as ProductName
from orders.orderdetails o;

