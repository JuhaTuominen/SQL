--Select * 
--From [SQL Tutorial].dbo.EmployeeDemographics

--update [SQL Tutorial].dbo.EmployeeSalary
--set JobTitle = 'Receptionist'
--where EmployeeID = 1010 --and Salary = 43000

--update [SQL Tutorial].dbo.EmployeeDemographics
--set Age = 31, Gender = 'Female'
--where FirstName = 'Holly' and LastName = 'Flax'

--update [SQL Tutorial].dbo.EmployeeDemographics
--set  Age = 35
--where FirstName = 'Darryl' and LastName = 'Philbin'

--Delete From [SQL Tutorial].dbo.EmployeeDemographics -- Varovaisuutta DELETEN kanssa. helposti poistaa vaikka koko taulun
--Where EmployeeID = 1005

--Select *
--From [SQL Tutorial].dbo.EmployeeDemographics --Tämä on hieman turvallisempi tapa DELETOIDA. 
--Where EmployeeID = 1004 --Ensin SELECT lausella hakee poistettavan jonka jälkeen muuttaa SELECT -> DELETE.