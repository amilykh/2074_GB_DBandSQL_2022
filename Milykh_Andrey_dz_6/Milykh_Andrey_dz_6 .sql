DROP DATABASE IF EXISTS milykh_andrey_dz_6;
CREATE DATABASE milykh_andrey_dz_6;
USE milykh_andrey_dz_6;

/*
Задача 1.

Создайте функцию, которая принимает кол-во сек и форматирует
их  в кол-во дней, часов, минут и секунд
Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'
*/
DROP FUNCTION IF EXISTS days_minutes_seconds;
DELIMITER $$
CREATE FUNCTION days_minutes_seconds(num INT)
RETURNS VARCHAR(255)
DETERMINISTIC  -- Одинаковый результат при вводе одинаковых данных
BEGIN	
    DECLARE res VARCHAR(255) DEFAULT " ";
    IF num < 60 THEN
		RETURN CONCAT(num, " seconds");
	ELSEIF num <3600 THEN
		RETURN CONCAT(FLOOR(num/60), " minutes ", num%60, " seconds");
	ELSEIF num < 86400 THEN	
		RETURN CONCAT(FLOOR(num/3600), " hours ", FLOOR((num%3600 )/60), " minutes ", (num%3600)%60, " seconds");
	ELSE
		RETURN CONCAT(FLOOR(num/86400), " days ", FLOOR((num%86400)/3600), " hours ", FLOOR((num%86400)%3600/60), " minutes ", (num%3600)%60, " seconds");    
    END IF;
END $$
DELIMITER ;

-- Вызов функции 
SELECT  days_minutes_seconds(123456);

-- SELECT days_minutes_seconds(1015557);
-- SELECT days_minutes_seconds(5);
-- SELECT days_minutes_seconds(10);
-- SELECT days_minutes_seconds(123);
-- SELECT days_minutes_seconds(456);
-- SELECT days_minutes_seconds(789);
-- SELECT days_minutes_seconds(1234);
-- SELECT days_minutes_seconds(5678);
-- SELECT days_minutes_seconds(9012);
-- SELECT days_minutes_seconds(12345);
-- SELECT days_minutes_seconds(67890);
-- SELECT days_minutes_seconds(123456);
-- SELECT days_minutes_seconds(789012345);

/*
Задача 2.

Выведите только четные числа от 1 до 10 включительно.
Пример: 2, 4, 6, 8, 10 (можно сделать через шаг + 2: x = 2, x+=2) 
*/
DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN	
	DECLARE num  INT DEFAULT 2;
    DECLARE result VARCHAR(100) DEFAULT '2';    
        
    label1: WHILE num < 10 DO
		SET num = num + 2;  
		SET result = CONCAT(result, ', ',num);              
	END WHILE label1;    
    
    SELECT result;
END $$
DELIMITER ;

-- Вызов процедуры 
CALL  even_numbers();