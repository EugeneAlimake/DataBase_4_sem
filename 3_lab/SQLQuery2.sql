use NE_MyBASE;
CREATE table ������
(ID_������ int primary key,
��������_������� nvarchar(50),
���� real,
����������_��_������ int,
�������_��������� nchar(10)
);
CREATE table ���������
(ID_��������� nvarchar(20) primary key,
������� nvarchar(20),
��� nvarchar(15),
�������� nvarchar(25),
����� nvarchar(30),
������� varchar(20),
Mail nvarchar(255),
�������_������ nchar(3)
);
CREATE table ������
(�����_������ nchar(10) primary key,
����_������� date,
ID_������ int foreign key references ������(ID_������),
����_�����������_������ real,
����������_�����������_������ int,
ID_��������� nvarchar(20) foreign key references ���������(ID_���������)
);
