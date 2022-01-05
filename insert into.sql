/* 
insert 將資料塞入資料庫當中
insert into TABLE(COL_1, COL_2)
values (1, 'data');
*/

insert into orders.shippers(ShipperID, ShipperName, Phone)
values (5, "Kane", "(07)726-8426");

/*
直接從別的 table 放資料進去 shippers 裡，就不需要打 values

insert into orders.shippers(ShipperID, ShipperName, Phone)
select 6, SupplierName, Phone #子查詢動作
from orders.suppliers
where supplierID = 2;


*/