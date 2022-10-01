/* Milykh_Andrey_dz_3 */

-- Создание и наполнение базы данных для выполнения домашнего задания.

DROP DATABASE IF EXISTS Milykh_Andrey_dz_3;
CREATE DATABASE Milykh_Andrey_dz_3;
USE Milykh_Andrey_dz_3;

# salespeople (продавцы)
DROP TABLE IF EXISTS salespeople;
CREATE TABLE salespeople
(
	snum INT  NOT NULL  PRIMARY KEY,
    sname VARCHAR(10) NOT NULL,
    city VARCHAR(10) NOT NULL,
    comm DECIMAL(2, 2)  
);

INSERT salespeople (snum, sname, city, comm)
VALUES
	(1001, 'Peel', 'London', .12),
    (1002, 'Serres', 'San Jose', .13),
    (1004, 'Motika', 'London', .11),
    (1007, 'Rifkin', 'Barcelon', .15),
    (1003, 'Axelrod', 'New York', .10);
    
-- SELECT * FROM salespeople;

# customers (заказчики)
DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
	cnum INT NOT NULL  PRIMARY KEY,
    cname VARCHAR(10) NOT NULL,
    city VARCHAR(10) NOT NULL,
    rating INT ,
    snum INT ,
    
    FOREIGN KEY (snum) REFERENCES salespeople(snum)    
);

INSERT customers (cnum, cname, city, rating, snum)
VALUES
	(2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'San Jose', 200, 1002),
    (2004, 'Grass' , 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'San Jose', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);
    
-- SELECT  * FROM customers;

# orders (заказы)
DROP TABLE IF EXISTS  orders;
CREATE TABLE orders
(
	onum INT NOT NULL PRIMARY KEY,
    amt DECIMAL(6,2),
    odate DATE NOT NULL,
    cnum INT,
    snum INT,
    
    FOREIGN KEY (cnum) REFERENCES customers(cnum),
    FOREIGN KEY (snum) REFERENCES salespeople(snum)   
);

INSERT orders (onum, amt, odate, cnum, snum)
VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
    (3003, 767.19, '1990-03-10', 2001, 1001),
    (3002, 1900.10, '1990-03-10', 2007, 1004),
    (3005, 5160.45, '1990-03-10', 2003, 1002),
    (3006, 1098.16, '1990-03-10', 2008, 1007),
    (3009, 1713.23, '1990-04-10', 2002, 1003),
    (3007, 75.75, '1990-04-10', 2004, 1002),
    (3008, 4723.00, '1990-05-10', 2006, 1001),
    (3010, 1309.95, '1990-06-10', 2004, 1002),
    (3011, 9891.88, '1990-06-10', 2006, 1001);
    
-- SELECT * FROM orders;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(45),
    surname varchar(45),
    specialty varchar(45),
    seniority INT,
    salary INT,
    age INT
);

INSERT INTO staff (`name`, surname, specialty, seniority,salary, age)
VALUES
	("Вася", "Васькин", "начальник", 40, 100000, 60),
    ("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Каткина", "инженер", 2, 70000, 25),
    ("Саша", "Сашкин", "инженер", 12, 50000, 35),
    ("Иван", "Иванов", "рабочий", 40, 30000, 59),
    ("Петр", "Петров", "рабочий", 20, 25000, 40),
    ("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "рабочий", 8, 19000, 28),
    ("Юра", "Юркин", "рабочий", 5, 15000, 25),
    ("Максим", "Воронин", "рабочий", 2, 11000, 22),
    ("Юра", "Галкин", "рабочий", 3, 12000, 24),
    ("Люся", "Люськина", "уборщик", 10, 10000, 49);
    
-- SELECT * FROM staff;

/*
Задача 1

Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
*/

SELECT city, sname, snum, comm
FROM salespeople
ORDER BY city;

/*
Задача 2

Напишите команду SELECT, которая вывела бы оценку (rating), сопровождаемую именем
каждого заказчика в городе San Jose. ("заказчики")
*/

SELECT rating, cname
FROM customers
WHERE city = "San Jose";

/*
Задача 3

Напишите запрос, который бы вывел бы значения snum всех продавцов из таблицы заказов
без каких бы то ни было повторений. (уникальные значения в "snum" "Продавцы")
*/
SELECT  DISTINCT snum 
FROM  orders;

/*
Задача 4*

Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
Используетсся оператор "LIKE": ("заказчики")
*/
SELECT cname 
FROM  customers
WHERE cname LIKE "G%";

/*
Задача 5

Напишите запрос, который может дать вам все заказы со значениями суммы выше,
чем $1,000. ("заказы")
*/
SELECT  onum, amt
FROM orders
WHERE amt  > 1000;

/*
Задача 6

Напишите запрос, который выбрал бы наименьшую сумму заказа для каждог заказчика.
("cnum" -  код заказчика)
*/
SELECT cnum,  MIN(amt)
FROM orders
GROUP BY cnum;

/*
Задача 7

Напишите запрос к таблице "заказчики", который может показать всех заказчиков,
у которых рейтинг больше 100 и они находятся не в Риме.
*/
SELECT *
FROM  customers
WHERE rating > 100 AND city != 'Rome';


/*
Задача 8

Таблица staff. Отсортируйте поле "зарплата" в порядке убывания и возрастания.
*/
SELECT *
FROM staff
ORDER BY salary DESC;  -- по убыванию 

SELECT *
FROM staff
ORDER BY salary;   -- по возрастанию (или "ORDER BY salary  ASC")

/*
Задача 9

Таблица staff. Отсортируйте  поле "зарплата" и выведите 5 строк с наибольшей заработной платой
*/
SELECT *
FROM staff
ORDER BY salary DESC LIMIT 5;  -- по убыванию 

/*
Задача 10

Таблица staff. Выполните группировку всех сотрудников по специальности "рабочий", зарплата 
которых превышает 20000	
*/
SELECT *
FROM staff
WHERE 	specialty = "рабочий" AND salary > 20000
ORDER BY salary DESC;
