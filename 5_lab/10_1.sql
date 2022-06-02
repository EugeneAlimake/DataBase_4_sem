select NAME, BDAY
from STUDENT
where BDAY in (SELECT  BDAY
FROM STUDENT
group by BDAY
having COUNT(*) > 1)
order by BDAY asc;