use UNIVER;
Select top 1
(select avg(NOTE) from PROGRESS
where PROGRESS.SUBJECT like '��')[��],
(select avg(NOTE) from PROGRESS
where PROGRESS.SUBJECT like '����')[����],
(select avg(NOTE) from PROGRESS
where PROGRESS.SUBJECT like '����')[����]
From PROGRESS