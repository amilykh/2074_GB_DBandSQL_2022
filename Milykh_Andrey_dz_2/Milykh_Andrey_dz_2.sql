/*
Задача 1. 
Используя операторы языка SQL, создайте табличку "sales". Заполните её данными.
*/
DROP DATABASE  IF EXISTS Milykh_Andrey_dz_2;
CREATE DATABASE Milykh_Andrey_dz_2;
USE Milykh_Andrey_dz_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	amount INT	
);

INSERT sales (order_date, amount)
VALUES
	('2021-01-01',  150),
	('2021-01-02',  70),
	('2021-01-02',  301),
	('2021-01-03', 100),
	('2021-01-04', 50),
	('2021-01-04', 300),
	('2021-01-04', 99),
	('2021-01-04', 330),
	('2021-01-05', 350);
   
   
/*
Задача 2.
Сгруппируйте значений количества в 3 сегмента - меньше 100, 100-300 и больше 300.
Используйте оператор IF.
*/    
SELECT id,  order_date,  
IF (amount < 100,  'less than 100', IF(amount > 300, 'greater than 300', '100 to 300'))
AS bucket
FROM sales;

/*
Задача 3.
Создайте таблицу "orders", заполните её значениями. Покажите "полный" статус
заказа, используя оператор CASE.
*/
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	orderid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	employeeid VARCHAR(3),
	amount DECIMAL(5,2),
	orderstatus VARCHAR(9)
);

INSERT orders (employeeid, amount, orderstatus)
VALUES
	('e03', 15.00, 'OPEN'),
	('e01',  25.50, 'OPEN'),
	('e05',  100.70, 'CLOSED'),
	('e02', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED'),
	('e04', 99.99, 'OPEN');   

SELECT orderid, orderstatus,
CASE
	WHEN orderstatus  =  'OPEN' THEN 'Order is in open sate.'
	WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
	WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled.'   
	ELSE 'FAIL'
END as order_summary  
FROM orders;


/*
Задача 4. Чем NULL отлиается от 0 ?
*/
/*
Для числового поля разница в том, что 0 может быть результатом арифметической операции.
NULL - это тоже значение. Оно означает НИЧЕГО. Но такое значение могут иметь только 
те поля, которые маркируются как NULLABLE, т.е. как поля, которые могут содержать НИЧЕГО.
*/



