use NE_MyBASE;
Select *From ЗАКАЗЫ;
UPDATE ЗАКАЗЫ set Количество_заказанного_товара=Количество_заказанного_товара+10 where Номер_заказа = 1;
Select *From ЗАКАЗЫ;