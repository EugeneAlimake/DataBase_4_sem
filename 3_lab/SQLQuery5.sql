use NE_MyBASE
SELECT ID_Заказчика, Фамилия From ЗАКАЗЧИКИ;
SELECT count(*) From ЗАКАЗЧИКИ;
SELECT Distinct  Название_товаров From ТОВАРЫ
Where Цена>100 
Select Top(1) ID_товара, Количество_заказанного_товара 
From ЗАКАЗЫ Order by Цена_заказанного_товара desc;