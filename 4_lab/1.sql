use UNIVER;
SELECT AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPE
from AUDITORIUM Inner Join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE=AUDITORIUM_TYPE.AUDITORIUM_TYPE