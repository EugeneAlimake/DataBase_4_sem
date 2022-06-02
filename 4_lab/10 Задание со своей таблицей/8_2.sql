use NE_MyBASE;
select ТОВАРЫ.ID_товара, ТОВАРЫ.Название_товаров,ТОВАРЫ.Цена
from ЗАКАЗЫ full outer join ТОВАРЫ
on ТОВАРЫ.ID_товара=ЗАКАЗЫ.ID_товара
where ТОВАРЫ.ID_товара is not null