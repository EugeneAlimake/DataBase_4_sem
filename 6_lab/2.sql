use UNIVER;
Select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
max(AUDITORIUM_CAPACITY)[Максимальная вместимость аудитории],
	   min(AUDITORIUM_CAPACITY)[Минимальная вместимость аудитории],
	   avg(AUDITORIUM_CAPACITY)[Средняя вместимость аудитории],
	   sum(AUDITORIUM_CAPACITY)[Сумма вместимости аудиторий],
	   count(*)				   [Количество всех аудиторий]
From AUDITORIUM Inner Join AUDITORIUM_TYPE
On AUDITORIUM.AUDITORIUM_TYPE=AUDITORIUM_TYPE.AUDITORIUM_TYPE Group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME;