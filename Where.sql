--Select * 
--From EmployeeDemographics -- tuo halutun nimen
--Where FirstName = 'Jim'

--Select * 
--From EmployeeDemographics -- tuo ne nimet jotka eivät ole "Jim"
--Where FirstName <> 'Jim'

--Select * 
--From EmployeeDemographics -- tuo kaikki joiden ikä on 30 tai yli (tai toiste päin <)
--Where Age >= 30

--Select * 
--From EmployeeDemographics -- lisätty (and) ja tuodaan vain ne joiden Gender on male 
--Where Age <= 32 and Gender = 'Male'

--Select * 
--From EmployeeDemographics -- lisätty (or) ja tuodaan ne jotka ovat 30 tai yli sekä Male Gender
--Where Age <= 32 or Gender = 'Male'

--Select * 
--From EmployeeDemographics -- tuo ne joiden sukunimi alkaa kirjaimella S. lisää '%' S kirjaimen eteen
--Where LastName like 'S%'   --  ja tuodaan kaikki nimet joissa on S. 'S%o%' tuo nimen jossa on S alussa
--							--  ja o jossain välissä

--Select * 
--From EmployeeDemographics -- tuo ne Employeet joissa on/olisi jokin tyhä tieto. is NOT null taas tuo
--Where FirstName is Null			 -- kaikki joissa ei ole NULL arvoja

--Select * 
--From EmployeeDemographics
--Where FirstName in ('Jim', 'Michael') -- helpompi tapa sanoa '=' useammalle kohteelle
