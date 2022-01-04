--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics

--Select * 
--From [SQL Tutorial].dbo.EmployeeSalary

--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics  -- n‰ytt‰‰ molemmat taulut EmployeeID:n perusteella
--inner join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics  -- n‰ytt‰‰ kaiken molemmista tauluista
--Full outer join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics  -- n‰ytt‰‰ kaiken vasemmasta taulusta ja kaiken mik‰ on yhteist‰ 
--Left outer join [SQL Tutorial].dbo.EmployeeSalary -- oikeanpuoleiseen tauluun. mutta jos tieto on vain oikealla 
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- puolella sit‰ ei n‰ytet‰.

--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics  -- sama kuin Left join mutta toiste p‰in. t‰ss‰ tapauksessa tulos 
--Right outer join [SQL Tutorial].dbo.EmployeeSalary -- on sama.
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- 

--Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary -- inner join n‰ytt‰‰ ainoastaan
--From [SQL Tutorial].dbo.EmployeeDemographics  -- kaiken mik‰ menee p‰‰lekk‰in molemmissa tauluissa. 
--Inner join [SQL Tutorial].dbo.EmployeeSalary -- Select EmployeeDemographics toimii siin‰ miss‰ 
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- EmployeeSalary.EmployeeID. tulos on sama. eli sovittaa kahden taulun yhten‰iset ID:t 

--Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary -- k‰ytet‰‰n EmployeeID:t‰ EmployeeSalary:st‰
--From [SQL Tutorial].dbo.EmployeeDemographics  -- n‰kyy kaikki EmployeeSalary taulusta joten tietojen ei tarvitse olla 
--Right outer join [SQL Tutorial].dbo.EmployeeSalary -- vasemmassa taulussa.
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- 

--Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary -- k‰ytet‰‰n EmployeeID:t‰ EmployeeDemographics:st‰
--From [SQL Tutorial].dbo.EmployeeDemographics  -- n‰kyy kaikki EmployeeDemographics taulusta joten tietojen ei tarvitse olla 
--Right outer join [SQL Tutorial].dbo.EmployeeSalary -- oikeassa taulussa. Huomaa ett‰ ID 1010 h‰vi‰‰ t‰ss‰ liitoksessa
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- 

--Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary -- peilikuva Right liitkosesta
--From [SQL Tutorial].dbo.EmployeeDemographics  -- n‰ytt‰‰ kaikki vasemmasta taulusta
--Left outer join [SQL Tutorial].dbo.EmployeeSalary -- 
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- 

--Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary -- nyt n‰ytet‰‰n EmployeeDemographics Left liitoksena ja
--From [SQL Tutorial].dbo.EmployeeDemographics  -- EmployeeSalary.EmployeeID n‰kym‰t muuttuu yll‰ olevaan 
--Left outer join [SQL Tutorial].dbo.EmployeeSalary -- 
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID -- 

--Select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary -- k‰yt‰nnˆn harjoitus
--From [SQL Tutorial].dbo.EmployeeDemographics   
--Inner join [SQL Tutorial].dbo.EmployeeSalary  
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID 
--where FirstName <> 'Michael'
--order by Salary desc

--Select JobTitle, AVG(Salary) -- k‰yt‰nnˆn harjoitus
--From [SQL Tutorial].dbo.EmployeeDemographics
--Inner join [SQL Tutorial].dbo.EmployeeSalary
--	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where JobTitle = 'Salesman'
--Group By JobTitle