/*
count 計算資料的數量
distinct 呈現不重複的資料

請在訂單明細(orderdetails)表格中，找出數量(quantity)大於 40 的資料，並且計算出不重複 productid，共有幾個。
*/

select count(distinct(ProductID)) as count
from orders.orderdetails
where Quantity > 40;
