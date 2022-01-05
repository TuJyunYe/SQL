/*
sum(col) : 欄位中數值的總和
avg(col)：欄位中數值的平均
abs(num) : num的絕對值
round(num, n) : num小數點後第n位四捨五入
truncate(num, n) : num值小數點後第n位，無條件捨去
pow(x, y) : x的y次方
sqrt(num) : num的平方根

請在訂單明細(orderdetails)表格中，找出每一筆訂單中，產品的平均價格，最後顯示出訂單ID與計算過後的平均價格的結果。
產品的平均價格需要四捨五入到小數點第一位。
*/

select o.OrderID, round(sum(o.quantity * p.price) / sum(o.quantity), 1) as avg
from orders.orderdetails o, orders.products p
where o.ProductID = p.ProductID
group by o.OrderID;