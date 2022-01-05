/*
SUBSTRING(str, pos) : 擷取字串從pos位置開始
SUBSTRING(str, pos, len) : 從pos起始位置開始，擷取長度len的字串
CONCAT(A, B) : 將A字串與B字串結合
REPLACE(A, ‘cde’, ‘fgh’) : 將A欄位或字串中的cde文字換成fgh文字
*/

select substring("abcdef", 2, 3);

select concat(LastName, " ", FirstName) as Name
from orders.employees;

select replace(LastName, "D", "A")
from orders.employees;