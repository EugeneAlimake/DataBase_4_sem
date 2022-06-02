create function Findavagevalue(@region varchar(30)) returns int
as 
begin
declare @av int = 0;
set @av = (
SELECT avg(PRODUCTS.PRICE)
from PRODUCTS
inner join ORDERS ON PRODUCTS.MFR_ID = ORDERS.MFR AND PRODUCTS.PRODUCT_ID = ORDERS.PRODUCT
inner join SALESREPS ON ORDERS.REP = SALESREPS.EMPL_NUM
inner join (SELECT*FROM OFFICES WHERE REGION = @region) AS OFFICES ON SALESREPS.REP_OFFICE = OFFICES.OFFICE)
return @av;
end

declare @avagevalue int = dbo.Findavagevalue('Western');
print 'Средняя цена товаров по определенному региону: ' + cast(@avagevalue as varchar(4));

declare @avagevalue int = dbo.Findavagevalue('Eastern');
print 'Средняя цена товаров по определенному региону: ' + cast(@avagevalue as varchar(4));

create function Findcustomers(@cou int, @creditlimit int) returns table
as return
Select   top (@cou) count(ORDERS.REP)[количество приобретенных товаров] ,CUSTOMERS.CUST_NUM, CUSTOMERS.CREDIT_LIMIT from CUSTOMERS 
inner join ORDERS on CUSTOMERS.CUST_REP=ORDERS.REP and CUSTOMERS.CREDIT_LIMIT<@creditlimit  
GROUP BY CUSTOMERS.CUST_NUM, CUSTOMERS.CREDIT_LIMIT
ORDER BY  count(ORDERS.REP) DESC

select* from dbo.Findcustomers(4,50000)



