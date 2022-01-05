# exists 用來判斷子查詢有沒有查詢的結果
# 若有結果，會直接回傳查詢後的結果；若沒有結果，則回傳空值
# exists 跟 in 語法相像，但 exists 的效率較高，也可以設定較多條件，所以建議用 exists 做查詢的動作
select *
from orders.orders o
where exists (
	select *
    from orders.orderdetails d
    where o.orderid = d.orderid
    and d.productid = 1000
);