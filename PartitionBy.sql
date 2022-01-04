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

--Aja kaikki kerralla, niin n�et miten Group By Partition tuo selke�mm�n n�kym�n!--

Select Gender, Count(Gender)
From [SQL Tutorial]..EmployeeDemographics dem
Join [SQL Tutorial]..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Group By Gender