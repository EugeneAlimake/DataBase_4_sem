use NE_MyBASE;
CREATE table ТОВАРЫ
(ID_товара int primary key,
Название_товаров nvarchar(50),
Цена real,
Количество_на_складе int,
Единица_измерения nchar(10)
);
CREATE table ЗАКАЗЧИКИ
(ID_Заказчика nvarchar(20) primary key,
Фамилия nvarchar(20),
Имя nvarchar(15),
Отчество nvarchar(25),
Адрес nvarchar(30),
Телефон varchar(20),
Mail nvarchar(255),
Признак_скидки nchar(3)
);
CREATE table ЗАКАЗЫ
(Номер_заказа nchar(10) primary key,
Дата_продажи date,
ID_товара int foreign key references ТОВАРЫ(ID_товара),
Цена_заказанного_товара real,
Количество_заказанного_товара int,
ID_Заказчика nvarchar(20) foreign key references ЗАКАЗЧИКИ(ID_Заказчика)
);
