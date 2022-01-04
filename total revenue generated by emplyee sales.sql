--Use Northwind;

SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Sum([Order Details].UnitPrice * Quantity * (1 - Discount)) AS ExtendedPrice
--into #TestTempTable
FROM Orders
INNER JOIN  [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN  Employees ON Orders.EmployeeID = Employees.EmployeeID
group by Employees.EmployeeID, Employees.FirstName, Employees.LastName
order by Employees.FirstName, Employees.LastName;

--order by ExtendedPrice desc;

--select * from #TestTempTable