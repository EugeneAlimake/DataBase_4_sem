use NE_MyBASE;

ALTER Table ТОВАРЫ ADD Срок_хранения int;
ALTER Table ЗАКАЗЧИКИ ADD Sold nchar(3) check (Sold in('да','нет'));
ALTER Table ТОВАРЫ DROP Column Срок_хранения;
SELECT *FROM ТОВАРЫ;
SELECT *FROM ЗАКАЗЧИКИ;