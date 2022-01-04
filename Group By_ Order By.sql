--Select * 
--From EmployeeDemographics
--Order By Age Desc, Gender Desc -- 4 Desc, 5 Desc -- joko pylvään nimellä tai numerolla alkaen 1 vasemmalta.

--Select Gender, Count (Gender) -- sitoo sisäänsä kaikki saman gender yksilöt, tässä tapauksessa 
--From EmployeeDemographics		 -- kahteen erilliseen ryhmään
--Group By Gender

--Select Gender, Age, Count (Gender) -- jos taulussua olisi kaksi tai enemmän saman ikäisiä ja samaa sukupuolta 
--From EmployeeDemographics			-- näkyisi se Count pylväässä. nyt kun ei ole niin jokainen ikää ja sukupuolta	 
--Group By Gender, Age				 -- edustava näytetään numerolla 1. select lauseen perässä voi olla useampi 
									-- haku määre kunhan ne löytyvät myös Goup By osasta!

--Select Gender, Count (Gender) As CountGender
--From EmployeeDemographics
--Where Age > 31
--Group By Gender
--Order By CountGender Desc