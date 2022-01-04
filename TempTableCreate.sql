Use Northwind;

select UnitPrice, Quantity, Discount
into #TestTempTable

from [Order Details]

select * from #TestTempTable