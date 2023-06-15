DROP DATABASE IF EXISTS hw6;
CREATE DATABASE hw6;
USE hw6;

/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
BEGIN
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	DECLARE RESULT VARCHAR(255);

	SET days = seconds DIV (24 * 3600);
	SET seconds = seconds MOD (24 * 3600);
	SET hours = seconds DIV 3600;
	SET seconds = seconds MOD 3600;
	SET minutes = seconds DIV 60;
	SET seconds = seconds MOD 60;

	SET RESULT = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

	RETURN RESULT;
END //

DELIMITER ;


SELECT format_seconds(123456);


/*
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 
*/


SET @number := 1;

WHILE @number < 10 DO 
	IF @number % 2 = 0 THEN
		SELECT @number;
	END IF;
	
	SET @number := @number + 1;

END WHILE;