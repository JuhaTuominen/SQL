--Create Table #temp_Employee (
--EmployeeID int,
--JobTitle varchar(100),
--Salary int)

--Select * From #temp_Employee

--Insert Into #temp_Employee Values (
--'1001', 'HR', '45000')

--Insert Into #temp_Employee
--Select *
--From [SQL Tutorial]..EmployeeSalary

--Drop Table If Exists #Temp_Employee2
--Create Table #Temp_Employee2 (
--JobTitle varchar(50),
--EmployeesPerJob int,
--AvgAge int, 
--AvgSalary int)

--Insert Into #Temp_Employee2
--Select Jobtitle, Count(JobTitle), Avg(age), Avg(Salary)
--From [SQL Tutorial]..EmployeeDemographics emp
--Join [SQL Tutorial]..EmployeeSalary sal
--	On emp.EmployeeID = sal.EmployeeID
--Group By JobTitle

--Select * From #Temp_Employee2