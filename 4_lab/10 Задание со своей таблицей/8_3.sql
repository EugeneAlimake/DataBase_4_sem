use NE_MyBASE;
select*
from ЗАКАЗЫ full outer join ТОВАРЫ
on ТОВАРЫ.ID_товара=ЗАКАЗЫ.ID_товара
where ТОВАРЫ.ID_товара is not null