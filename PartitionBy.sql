Select FirstName, LastName, Gender, Salary,
Count(Gender) Over (Partition By Gender) As TotalGender
From [SQL Tutorial]..EmployeeDemographics dem
Join [SQL Tutorial]..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

Select FirstName, LastName, Gender, Salary, Count(Gender) 
From [SQL Tutorial]..EmployeeDemographics dem
Join [SQL Tutorial]..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Group By FirstName, LastName, Gender, Salary

--Aja kaikki kerralla, niin näet miten Group By Partition tuo selkeämmän näkymän!--

Select Gender, Count(Gender)
From [SQL Tutorial]..EmployeeDemographics dem
Join [SQL Tutorial]..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Group By Gender