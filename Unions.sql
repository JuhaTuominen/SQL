--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics
--Full Outer Join [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--	On EmployeeDemographics.EmployeeID = 
--	WareHouseEmployeeDemographics.EmployeeID

--Select *
--From [SQL Tutorial].dbo.EmployeeDemographics
----Union All --yhdist‰‰ taulut ja poistaa dublikaatit /k‰yt‰ All niin n‰ytt‰‰ myˆs ne.
--		--toimii vain jos tauluissa on samanlaiset pylv‰‰t!
--		--normaali join tuo molemmat tulosteeseen
--Select *
--From [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--Order By EmployeeID

Select  EmployeeID, FirstName, Age
From [SQL Tutorial].dbo.EmployeeDemographics
Union --t‰ss‰ tapauksessa vaikka taulut ovat erillaiset t‰m‰ toimii. koska on ID, 
		--nimi/titteli ja ik‰. eli ID,text ja int. t‰m‰ ei ole toimiva tapa.
		--koska tuloste ei ole oikein. esim salesman ei ole nimi ja 45000 ei ole ik‰!
Select EmployeeID, JobTitle, Salary
From [SQL Tutorial].dbo.EmployeeSalary
Order By EmployeeID