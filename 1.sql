/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds
*/

delimiter //
create function tttimes (seconds int)
returns char(255)
deterministic
begin

declare days char(3);
declare hours, minutes, sec char(2);
declare result char(255);

set days = cast(floor(seconds/60/60/24) as char(3));
set hours = cast(floor(mod(seconds/60/60/24,1)*24) as char(2));
set minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) as char(2));
set sec = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) as char(2));
set result = concat(days, " days ", hours, " hours ", minutes, " minutes ", sec, " seconds");

return result;
end //
delimiter ;

select tttimes(123456);
