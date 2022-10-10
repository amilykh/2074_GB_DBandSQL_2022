DROP DATABASE IF EXISTS milykh_andrey_dz_5;
CREATE DATABASE milykh_andrey_dz_5;
USE milykh_andrey_dz_5;

-- таблицы для задач 1-3
DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(10)  NOT NULL,
    Cost INT NOT NULL
);

INSERT cars(`Name`, Cost)
VALUES 
	('Audi', 52642),
    ('Mercedes', 57127),
    ('Skoda', 9000),
    ('Volvo', 29000),
    ('Bentley', 350000),
    ('Citroen', 21000),
    ('Hummer', 41400),
    ('Volkswagen', 21600);
-- SELECT Id, `Name`,  Cost FROM cars;

-- таблицы для задачи 4
DROP TABLE IF EXISTS `Groups`;
CREATE TABLE `Groups` (
	gr_id INT PRIMARY KEY AUTO_INCREMENT,  -- ID группы
    gr_name VARCHAR(100),  -- название группы
    gr_temp INT  -- температурный режим (не будем заполнять)
);

INSERT  `Groups`(gr_name)
VALUES
	('Гематологические нализы'),
    ('Анализ мочи'),
    ('Биохимические исследования крови');
-- SELECT * FROM `Groups`;    

DROP TABLE  IF EXISTS Analysis;
CREATE TABLE Analysis (
	an_id INT PRIMARY KEY AUTO_INCREMENT,  -- ID анализа
    an_name VARCHAR(255) NOT NULL,  -- название анализа
    an_cost  DECIMAL(6,2) NOT NULL,  -- себестоимость анализа
    an_price  DECIMAL(6,2) NOT NULL,  -- розничная цена анализа 
    an_group INT NOT NULL,  -- группа анализов
    
    FOREIGN KEY (an_group) REFERENCES `Groups` (gr_id)
);

INSERT Analysis(an_name, an_cost, an_price, an_group)
VALUES
	('Общий (клинический) анализ крови на автоматическом анализаторе', 150, 250, 1),
    ('Общий (клинический) анализ крови развернутый на автоматическом анализаторе', 230, 480, 1),
    ('Соотношение лейкоцитов крови (подсчет лейкоцитарной формулы с описанием морфологии)', 100, 240, 1),
    ('Исследование уровня ретикулоцитов крови', 210, 370, 1),
    ('Исследование скорости оседания эритроцитов (СОЭ)', 100, 200, 1),
    
    ('Анализ мочи общий', 150, 310, 2),
    ('Микроскопическое иследование осадка мочи (по Нечипоренко)', 140, 300, 2),
    ('Микроскопическое иследование осадка мочи', 70, 180, 2),
    ('Проба Зимницкого', 70, 180, 2),
    ('Исследование уровня глюкозы в моче', 70, 180, 2),
    ('Глюкозурический профиль (глюкоза в 3-х порциях мочи)', 300, 600, 2),
    ('Определение белка в моче', 80, 190, 2),
    
    ('Анализ крови биохимический (12 аналитов по листу)', 1100, 2200, 3),
    ('Анализ крови биохимический (кардиологическй профиль)', 1700, 3400, 3);
-- SELECT * FROM Analysis;
    
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
	ord_id INT PRIMARY KEY AUTO_INCREMENT,  -- ID заказа
    ord_datetime DATETIME,  -- дата и время заказа
    ord_an INT NOT NULL,  -- ID анализа
    
    FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
);

INSERT Orders(ord_datetime, ord_an)
VALUES
	('2020-02-03 08:30:00', 1),
    ('2020-02-03 09:10:15', 2),
    ('2020-02-03 10:33:47', 3),
    
    ('2020-02-04 12:11:03', 4),
    ('2020-02-04 13:33:01', 5),
    ('2020-02-04 14:29:38', 6),
        
    ('2020-02-05 15:21:24', 7),  -- 05.02.2022
    ('2020-02-05 16:48:21', 8),
    ('2020-02-05 17:37:53', 9),
    
    ('2020-02-06 18:51:22', 10), -- 06.02.2022 
    ('2020-02-06 08:21:16', 1),
    ('2020-02-06 09:01:32', 2),
    
    ('2020-02-07 10:19:53', 3),  -- 07.02.2022
    ('2020-02-07 11:28:19', 4),
    ('2020-02-07 12:47:31', 5),
    
    ('2020-02-08 13:24:36', 12),  -- 08.02.2022
    ('2020-02-08 15:47:12', 14),
    ('2020-02-08 16:27:13', 3),
    
    ('2020-02-09 10:34:55', 1),  -- 09.02.2022
    ('2020-02-09 13:15:22', 6),
    ('2020-02-09 14:53:19', 13),
    
    ('2020-02-10 11:21:43', 2),  -- 10.02.2022
    ('2020-02-10 13:44:28', 7),
    ('2020-02-10 16:36:19', 13),
    
    ('2020-02-11 09:42:21', 3),  -- 11.02.2022
    ('2020-02-11 12:29:35', 8),
    ('2020-02-11 15:46:44', 14),
    
	('2020-02-12 10:01:02', 4),  -- 12.02.2022
    ('2020-02-12 11:36:17', 6),
    ('2020-02-12 15:22:39', 14),
    
	('2020-02-13 08:11:53', 5),  
    ('2020-02-13 10:42:18', 9),
    ('2020-02-13 15:41:29', 12),
    
	('2020-02-14 12:11:23', 1),  
    ('2020-02-14 13:25:33', 9),
    ('2020-02-14 16:16:49', 13);


-- таблицы для задачи 5
DROP TABLE IF EXISTS timeline;
CREATE TABLE timeline (
	train_id INT,
    station VARCHAR(20),
    station_time TIME  -- time withou time zone    
);

INSERT timeline(train_id, station, station_time)
VALUES
	(110, 'San Francisco', '10:00:00'),
    (110, 'Redwood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
    (120, 'Palo Alto', '12:49:00'),
    (120, 'San Jose', '13:30:00');
-- SELECT * FROM timeline;


/*
Задача 1.

Создайте представление, в которое попадут автомобили стоимостью 
до 25 000 долларов
*/
CREATE OR REPLACE VIEW  cost_less_than AS
SELECT  Id, `Name`, Cost
FROM cars c
WHERE Cost < 25000;  -- до 25 000
SELECT Id, `Name`, Cost FROM  cost_less_than
ORDER BY Cost;

/*
Задача 2.

Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW). 
*/
ALTER VIEW  cost_less_than AS
SELECT  Id, `Name`, Cost
FROM cars c
WHERE Cost < 30000; -- до 30 000
SELECT Id, `Name`, Cost FROM cost_less_than
ORDER BY Cost;

/*
Задача 3.

Создайте представление, в котором будут только автомобили 
марок "Шкода" и "Ауди"
*/
CREATE OR REPLACE VIEW  Skoda_and_Audi AS
SELECT Id, `Name`, Cost
FROM cars  c
WHERE `Name` IN ('Audi', 'Skoda');
SELECT Id, `Name`, Cost FROM Skoda_and_Audi;

/* 
Задача 4

Вывести название и цену для всех анализов, которые продавались 
5 февраля 2020 и всю следующую неделю.
*/    
SELECT 
	o.ord_id, 
	o.ord_datetime,
    a.an_name, 
    a.an_price    
FROM Orders o
INNER JOIN Analysis a ON o.ord_an=a.an_id
WHERE datediff(o.ord_datetime, '2020-02-05 00:00:00') >= 0
	  AND datediff(o.ord_datetime, '2020-02-05 00:00:00') < 8
ORDER BY o.ord_datetime;


/*
Задача 5

Добавьте новый столбец под названием "время до следующей станции". Чтобы получить это
значение, мы вычитем время транций для пар вмежных станций. Мы можем вычислить это
значение без использования оконной функции SQL, но это может быть очень сложно. Проще это 
сделать с помощью оконной функции LEAD. Эта функция сравнивает значения из одной строки
со следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения 
в столбце "время" для станции со станцией сразу после неё.
*/
SELECT  
	train_id, 
    station,
    station_time,
    TIMEDIFF( LEAD(station_time)   OVER(PARTITION BY train_id ORDER BY train_id) , station_time) AS time_to_next_station
FROM timeline;