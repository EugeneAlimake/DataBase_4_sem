use NE_MyBASE;
select ЗАКАЗЫ.ID_Заказчика, ЗАКАЗЫ.ID_товара, ЗАКАЗЫ.Цена_заказанного_товара
from ЗАКАЗЫ full outer join ТОВАРЫ
on ЗАКАЗЫ.ID_товара=ТОВАРЫ.ID_товара
where ЗАКАЗЫ.ID_товара is not null