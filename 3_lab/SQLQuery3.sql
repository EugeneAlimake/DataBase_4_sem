use NE_MyBASE;

ALTER Table ������ ADD ����_�������� int;
ALTER Table ��������� ADD Sold nchar(3) check (Sold in('��','���'));
ALTER Table ������ DROP Column ����_��������;
SELECT *FROM ������;
SELECT *FROM ���������;