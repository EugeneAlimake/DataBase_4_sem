use UNIVER;
Select*
From(select 
Case 
when PROGRESS.NOTE = 10 then '10'
				when PROGRESS.NOTE = 8 or PROGRESS.NOTE = 9 then '8-9'
				when PROGRESS.NOTE = 6 or PROGRESS.NOTE = 7 then '6-7'
				else '4-5' 
end[Оценка], COUNT(*)[Количество]
From PROGRESS Group by Case
when PROGRESS.NOTE = 10 then '10'
				when PROGRESS.NOTE = 8 or PROGRESS.NOTE = 9 then '8-9'
				when PROGRESS.NOTE = 6 or PROGRESS.NOTE = 7 then '6-7'
				else '4-5' 
end) as P
Order by case[Оценка]
when '10' then 1
when '8-9' then 2
when '6-7' then 3
else 4 
end