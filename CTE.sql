With CTE_Employee As 
(Select FirstName, LastName, Gender, Salary,
Count(Gender) Over (Partition By Gender) As TotalGender,
AVG(Salary) Over (Partition By Gender) As AvgSalary
From [SQL Tutorial]..EmployeeDemographics emp
Join [SQL Tutorial]..EmployeeSalary sal
	On emp.EmployeeID = sal.EmployeeID
Where Salary > '45000')
--Select * 
--From CTE_Employee

Select FirstName, AvgSalary
From CTE_Employee