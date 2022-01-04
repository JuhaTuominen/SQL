-- Exec dbo.uspRivienMonistus 200 --Parametri osoittaa montako kertaa tietokantaulujen sis‰ltˆ monistetaan proseduurin toimiseta
-- Select * From OrdersTemp1 Where OrderID = 40213
-- Select * From [Order detailsTemp1 Where OrderID = 40213
-- Select * From [Order details] Where OrderID = 11077

/*
Select Count (*) From [Order DetailsTemp1]
Select Count (*) From OrdersTemp1
*/

Create Procedure [dbo].[uspRivienMonistus] @lkm int
As
	Set Nocount On
	--Muutujam‰‰ritykset
	Declare @NewOrderID int,
			@CustomerID nchar(5),
			@EmployeeID int,
			@OrderDate DateTime,
			@RequiredDate DateTime,
			@ShippedDate DateTime,
			@ShipVia int,
			@Freight money,
			@ShipName nvarchar(40),
			@ShipAddress nvarchar(60),
			@ShipCity nvarchar(15),
			@ShipRegion nvarchar(15),
			@ShipPostalCode nvarchar(10),
			@ShipCountry nvarchar(15),
			@ProductID int,
			@UnitPrice money,
			@Quantity smallint,
			@Discount real,
			@OrderIdOrders int,
			@OrderIdOrderDetails int,
			@OrdersTempRowCount int,
			@OrderDetailsTempRowCount int

	--Aikaisemmat datamassoja varten luodut tietokantataulut poistetaan. Tarkistetaan niiden olemassa olo
	If Exists (Select name From sys.tables Where name = 'OrdersTemp1')
	Begin
	Drop Table OrdersTemp1
	End
	If Exists (Select name From sys.tables where name ='Order detailsTemp1')
	Begin
	Drop Table [Order detailsTemp1]
	End

	--Luodaan OrdersTemp taulu, johon varsinaisen taulun, Orders tiedot vied‰‰n ja samalla monistetaan parametrin osoittaman m‰‰r‰n verran
	Create Table OrdersTemp1 (OrderID int Identity(1000,1), CustomerID nchar(5), EmployeeID int, OrderDate DateTime, RequiredDate DateTime, ShippedDate DateTime,
	ShipVia int, Freight money, ShipName nvarchar(40), ShipAddress nvarchar(60), ShipCity nvarchar(15), ShipRegion nvarchar(15), ShipPostalCode nvarchar(10), ShipCountry nvarchar(15))

	--Luodaan [Order detailsTemp] taulu. T‰nne vied‰‰n [Order details] -taulun datat monistettuna
	Create Table [Order detailsTemp1] (OrderID int, ProductID int, UnitPrice money, Quantity smallint, Discount real)
	Set @OrdersTempRowCount = 0 --Lis‰ttyjen tilausten laskurimuuttuja nollataan aluksi
	Set @OrderDetailsTempRowCount = 0 --Listtyjen tilausrivien laskurimuuttuja nollataan aluksi
	--Looppina suoritetaan, niin monta kertaa, kuin parametrina annettu luku vaatii (joka kierroksella luku pienennet‰‰n yhdell‰)
	While @lkm > 0
	Begin
		--Kursorik‰sittelyn m‰‰ritykset -orderKursori
		Declare ordersKursori Cursor
		For Select OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
		From Orders
		Open ordersKursori

		--Ensimm‰isen rivin haku ordersKursorista
		Fetch Next From ordersKursori Into @OrderIdOrders, @CustomersID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity,
										   @ShipPostalCode, @ShipCountry

		--Looppi pyˆrii niin kauan kuin kursorissa on rivej‰
		While @@FETCH_STATUS = 0
		Begin
			Set @OrdersTempRowCount = @OrdersTempRowCount+1 --Kasvattaa k‰sitteltyjen tialusten m‰‰r‰‰ laskurilla
			If @OrdersTempRowCount%100 = 1 --tuolstaa joka sadannella kerralla tiedot messages-ikkunaan
			Begin
				Print 'Lis‰tty' + Convert(varchar,@OrdersTempRowCount) + 'rivi‰ OrdersTemp Tauluun!'
				Print 'Lis‰tty' + Convert(varchar,@OrderDetailsTempRowCount) + 'rivi‰ Order DetailsTemp tauluun!'
			End
			--Lis‰ys OrdersTemp tauluun
			Insert OrdersTemp1 (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
			Values (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShipAddress, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)

			--Haetaan viimeksi list‰yn tilauksen OrderID talteen Scope_Identity() -funktiolla, joka hakee viimeksi lis‰tyn rivin identity-arvon
			Set @NewOrderID = SCOPE_IDENTITY() --taikka @@Identity, Lue:----

			--Kursorik‰sittelyn m‰‰ritykset - orderDetailKursori - haetaan ne miss‰ OrderID on Orders taulusta tilleen rivin OrderID
			Declare orderKursori Cursor
			For Select OrderID, ProductID, UnitPrice, Quantity, Discount From [Order Details] Where OrderID = @OrderIdOrders
			Open orderDetailsKursori

			--Ensimm‰isen rivin haku ordersDetailskursorista
			Fetch Next From orderDetailsKursori Into @OrderIdOrderDetails, @ProductID, @UnitPrice, @Quantity, @Discount

			--Lis‰t‰‰n kunkin alkuper‰isen Orders:in mukaisia [Order Details] -rivej‰ orderDetailsKursorista uuteen [Order detailsTemp1] -tauluun k‰ytt‰en uutta OrderID:t‰
			While @@FETCH_STATUS = 0
			Begin
				Set @OrderDetailsTempRowCount = @OrderDetailsTempRowCount + 1 --Kasvatetaan k‰siteltyjen tilausrivien lukum‰‰r‰‰ yhdell‰ joka kierroksella
				--Lis‰ys Order detailsTemp tauluun
				Insert [Order detailsTemp1] (OrderID, ProductID, UnitPrice, Quantity, Discount)
				Values (@NewOrderID, @ProductID, @UnitPrice, @Quantity, @Discount)

				--Seuraavan rivin haku ordersDetailskursorista
				Fetch Next From orderDetailsKursori Into @OrderIdOrderDetails, @ProductID, @UnitPrice, @Quantity, @Discount
			End

			--Seuraavan rivin haku orderskursorista
			Fetch Next From ordersKursori Into @OrdersIdOrders, @CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress,
			@ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountrt

			--Suljetaan ja valautetaan orderDetailsKursori
			Close orderDetailsKursori
			Deallocate orderDetailsKursori
		End

		--V‰hennet‰‰n parametrina annettu luku yhdell‰ jokaisella loopin kierroksella
		Set @lkm =  @lkm - 1

		--Suljetaan ja vapautetaan ordersKursori
		Close ordersKursori
		Deallocate ordersKursori
	End
	--Asetetaan OrdersTemp tauluun rivilukum‰‰r‰ muuttujaan
	Set @OrdersTempRowCount = (Select Count(*) From OrdersTemp1)
	--Asetetaan Order DetailsTemp tauluun rivilukum‰‰r‰ muutujaan
	Set @OrderDetailsTempRowCount = (Select COUNT(*) From [Order detailsTemp1])
	--Tulostetaan konsoliin lis‰yksen lopputulos
	Print '----------------------------------------------------------------------------'
	Print 'Lis‰tty yhteens‰ ' + Convert(varchar,@OrdersTempRowCount) + ' rivi‰ OrdersTemp tauluun!'
	Print ' '
	Print 'Lis‰tty yhteens‰ ' + Convert(varchar,@OrderDetailsTempRowCount) + ' rivi‰ Order DetailsTemp tauluun!'
Go