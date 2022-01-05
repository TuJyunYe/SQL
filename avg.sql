/*
加 +
減 -
乘 *
除 /

請計算 Products 表格中所有產品價格的平均值
*/

select avg(Price) as avg
from orders.products;