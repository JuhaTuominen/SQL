--Select * 
--From EmployeeDemographics
--Order By Age Desc, Gender Desc -- 4 Desc, 5 Desc -- joko pylv��n nimell� tai numerolla alkaen 1 vasemmalta.

--Select Gender, Count (Gender) -- sitoo sis��ns� kaikki saman gender yksil�t, t�ss� tapauksessa 
--From EmployeeDemographics		 -- kahteen erilliseen ryhm��n
--Group By Gender

--Select Gender, Age, Count (Gender) -- jos taulussua olisi kaksi tai enemm�n saman ik�isi� ja samaa sukupuolta 
--From EmployeeDemographics			-- n�kyisi se Count pylv��ss�. nyt kun ei ole niin jokainen ik�� ja sukupuolta	 
--Group By Gender, Age				 -- edustava n�ytet��n numerolla 1. select lauseen per�ss� voi olla useampi 
									-- haku m��re kunhan ne l�ytyv�t my�s Goup By osasta!

--Select Gender, Count (Gender) As CountGender
--From EmployeeDemographics
--Where Age > 31
--Group By Gender
--Order By CountGender Desc