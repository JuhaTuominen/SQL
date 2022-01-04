--Select Top 5 * --top 5 tai enemmän
--From EmployeeDemographics

--Select * --kaikki
--From EmployeeDemographics

--Select FirstName --yhdellä tiedolla
--From EmployeeDemographics

--Select FirstName, LastName --useammalla tiedolla
--From EmployeeDemographics

--Select Distinct(Age) --esimerkin mukaisesti tuo Male ja Female Genre pylväästä
--From EmployeeDemographics

--Select Count(LastName) As LastNameCount --tuo yhteen lasketun summan pylvään sisältämistä tiedoista 
--From EmployeeDemographics

--Select Max(Salary) -- Min, Avg  tuo suurimman, keskiarvon ja pienimmän luvun
--From EmployeeSalary

--Select * -- [] sulkeet koska tietokannan nimessä on välilyönti
--From [SQL Tutorial].dbo.EmployeeDemographics