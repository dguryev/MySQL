/*
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/

DELIMITER //
create function numbers() returns char(255)
deterministic
BEGIN
    declare n int default 0;
    declare max_n int default 10;
    declare result char(255) default "";
    
    while n < max_n do
        set n = n + 2;
        set result = concat(result, n, ",");
    end while;
    
    set result = trim(TRAILING "," FROM result);
    
    return result;

END //
DELIMITER ;

select numbers();
