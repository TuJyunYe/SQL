/* 
Stored Procedure 是在資料庫中建立的一組工作程序， 個人理解就是把不想在 App Server 上跑的部分，寫 function 在 DB 裡跑。
有些需求會反覆用到DB，例如做統計報表，或是不想把邏輯放在App，例如用戶登入， 都可以寫一個Stored Procedure一次完成要執行的工作。
*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_summary`(sum int, add_time datetime)
BEGIN

if add_time < now() then 
	insert into summary(sum, date) values(sum, add_time);
else
	select "error";
end if;

END