use NE_MyBASE
SELECT ISNULL(ЗАКАЗЫ.ID_товара,'0')[Товар],
ТОВАРЫ.Количество_на_складе
FROM ТОВАРЫ Left Outer JOIN ЗАКАЗЫ
ON ТОВАРЫ.ID_товара=ЗАКАЗЫ.ID_товара
