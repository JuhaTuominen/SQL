--Select Demo.EmployeeID, Sal.Salary
--From [SQL Tutorial].dbo.EmployeeDemographics As Demo  --Aliasing tekee väliaikaiset muutokset
--join [SQL Tutorial].dbo.EmployeeSalary as Sal  --helpottaa omaa koodaamista ja vaikka toisille näyttämistä
--	on Demo.EmployeeID = Sal.EmployeeID

--Select FirstName AS Fname
--From [SQL Tutorial].dbo.EmployeeDemographics

--Select FirstName + ' ' + LastName as FulName
--From [SQL Tutorial].dbo.EmployeeDemographics

--Select AVG(Age) as AVGAge
--From [SQL Tutorial].dbo.EmployeeDemographics

--Select Demo.EmployeeID, Demo.FirstName, Demo.FirstName,
--	Sal.JobTitle, Ware.Age
--From [SQL Tutorial].dbo.EmployeeDemographics Demo  --Selkeämpi pidempi join lause kuin perinteinen 
--Left Join [SQL Tutorial].dbo.EmployeeSalary Sal  --a.taulu, b.taulu, c.taulu.
--	on Demo.EmployeeID = Sal.EmployeeID
--Left Join [SQL Tutorial].dbo.WareHouseEmployeeDemographics Ware
--	On Demo.EmployeeID = Ware.EmployeeID