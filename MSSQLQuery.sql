/* 2019.04.30 上課練習 */
/* 第一題 */
SELECT a.ID, a.name, a.birthday
FROM Table_Student_BasicData a
WHERE a.birthday <= '19871124'
ORDER BY a.birthday DESC ;

/* 第二題 */
SELECT a.name, b.name, c.name
FROM Table_Student_BasicData a, Table_Department_BasicData b, Table_Institution_BasicData c
WHERE a.name like '張%' 
  AND a.department_ID = b.department_ID 
  AND b.institution_ID = c.institution_ID ;

/* 第三題 */
SELECT c.name, d.name
FROM Table_Department_BasicData a, Table_Sex_BasicData b, Table_Student_BasicData c, Table_LearnCourse_BasicData d, Table_CourseCategory_BasicData e, Table_StudentCourse_MappingData f
WHERE a.name = '電機系'
  AND a.department_ID = c.department_ID
  AND b.SEX_ID = c.SEX_ID
  AND b.name = '男生'
  AND a.department_ID = d.department_ID
  AND d.CC_ID = e.CC_ID
  AND e.category = '必修'
  AND d.LC_ID = f.LC_ID
  AND f.ID = c.ID ; 

/* 第四題 */
SELECT b.name, c.name, b.address, b.telephone
FROM Table_Department_BasicData a, Table_Student_BasicData b, Table_Sex_BasicData c
WHERE a.name = '工工系'
  AND a.department_ID = b.department_ID
  AND (b.address LIKE '台北%' OR b.address LIKE '高雄%') 
  AND b.SEX_ID = c.SEX_ID

/* 第五題 */
SELECT c.name
FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Product_BasicData c
WHERE a.name = '張邦育'
  AND a.ID = b.ID
  AND b.Product_ID = c.Product_ID

/* 第六題 */
SELECT a.name, a.price, c.name
FROM Table_Product_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Student_BasicData c
WHERE a.price > 500
  AND a.Product_ID = b.Product_ID
  AND b.ID = c.ID


/* 2019.05.07 上課練習 */
/* 第一題 */
SELECT c.name, d.name, a.ID, a.name, f.name, e.score
FROM Table_Student_BasicData a, Table_StudentPost_MappingData b, Table_StudentClub_BasicData c, Table_ClubPost_BasicData d, Table_StudentCourse_MappingData e, Table_LearnCourse_BasicData f
WHERE (d.name = '社長' OR d.name = '副社長')
  AND a.ID = b.ID
  AND b.CLUB_ID = c.CLUB_ID
  AND b.Post_ID = d.Post_ID
  AND e.score > 60
  AND a.ID = e.ID
  AND e.LC_ID = f.LC_ID ;

/* 第二題 */
SELECT b.name, c.name, e.pay
FROM Table_Department_BasicData a, Table_Institution_BasicData b, Table_Teacher_BasicData c, Table_TeacherPay_BasicData d, Table_PayLevel_BasicData e
WHERE a.institution_ID = b.institution_ID
  AND a.department_ID = c.department_ID
  AND c.Teacher_ID = d.Teacher_ID
  AND d.Level_ID = e.Level_ID ; 


/* 2019.05.14 上課練習 */
/* 第一題 */
SELECT b.category, max(a.price) 最高價, min(a.price) 最低價, avg(a.price) 平均價格
FROM Table_Product_BasicData a, Table_ProductCategory_BasicData b
WHERE a.PC_ID = b.PC_ID
GROUP BY b.category ;

/* 第二題 */
SELECT count(b.TransactionRecords_ID) 交易筆數
FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b
WHERE a.name = '涂俊曄'
  AND a.ID = b.ID ;

/* 第三題 */
SELECT max(b.quantity * c.price) 最大總金額
FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Product_BasicData c
WHERE a.name = '涂俊曄'
  AND a.ID = b.ID
  AND b.Product_ID = c.Product_ID ;

/* 第四題 */
SELECT sum(b.quantity * c.price) 交易總金額
FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Product_BasicData c
WHERE a.name = '涂俊曄'
  AND a.ID = b.ID
  AND b.Product_ID = c.Product_ID ;

/* 第五題 */
SELECT count(b.LC_ID) 修課數量, sum(c.academic_score) 總學分數
FROM Table_Student_BasicData a, Table_StudentCourse_MappingData b, Table_LearnCourse_BasicData c
WHERE a.name = '涂俊曄'
  AND a.ID = b.ID
  AND b.LC_ID = c.LC_ID ;

/* 新增語法 */
INSERT INTO Table_Department_BasicData (department_ID, name, matter, time, institution_ID)
VALUES ('DT_10', '工業管理學系', '比工工還管理，比企管還工程。', '2009/12/09', '管理學院' ) ;

/* 修改語法 */
UPDATE Table_Department_BasicData
SET name = '工業工程與資訊管理學系'
WHERE department_ID = 'DT_10' ; 

/* 刪除語法 */
DELETE Table_Department_BasicData
WHERE department_ID = 'DT_10' ;


/* 2019.05.21 上課練習 */
/* 第一題 */
SELECT a.name, a.price
FROM Table_Product_BasicData a
WHERE a.price < (
  SELECT AVG(a.price)
  FROM Table_Product_BasicData a, Table_ProductCategory_BasicData b
  WHERE a.PC_ID = b.PC_ID
    AND b.category = '3C') ;

/* 第二題 */
SELECT d.category, c.name
FROM Table_Product_BasicData c, Table_ProductCategory_BasicData d
WHERE c.price > (
	SELECT MAX(c.price)
	FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Product_BasicData c
	WHERE a.name = '張邦育'
	 AND a.ID = b.ID
	 AND b.Product_ID = c.Product_ID)
  AND c.PC_ID = d.PC_ID ;

/* 第三題 */
SELECT a.name
FROM Table_Department_BasicData a
WHERE a.time between (
				SELECT min(a.time)
				FROM Table_Department_BasicData a
				WHERE a.name in ('統計系', '工工系') ) 
			 and (
				SELECT max(a.time)
				FROM Table_Department_BasicData a
				WHERE a.name in ('統計系', '工工系') ) ;

/* 第四題 */
SELECT a.name, b.name
FROM Table_Student_BasicData a, Table_Department_BasicData b
WHERE a.birthday = (
		SELECT min(a.birthday)
		FROM Table_Student_BasicData a)
  AND a.department_ID = b.department_ID ;

/* 第五題 */
SELECT a.name
FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Product_BasicData c
WHERE c.price = (
		SELECT max(c.price)
		FROM Table_Student_BasicData a, Table_ProductTransactionRecords_MappingData b, Table_Product_BasicData c
		WHERE a.name = '涂俊曄'
		  AND a.ID = b.ID
		  AND b.Product_ID = c.Product_ID)
  AND a.ID = b.ID
  AND b.Product_ID = c.Product_ID ;
