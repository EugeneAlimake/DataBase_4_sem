use NE_MyBASE;
SELECT ������.��������_�������, ������.����_�������,
Case
when(������.����_�����������_������ between 1 and 50) then '����<50'
when (������.����_�����������_������ between 50 and 100) then '���� �� 50 �� 100'
else '���� ������ 100'
end [������� ���]
From ������ inner join ������
ON ������.ID_������=������.ID_������ 
ORDER BY 
(
Case 
when(������.����_�����������_������ between 1 and 50) then 3
when (������.����_�����������_������ between 50 and 100) then 1
else 2
end
)