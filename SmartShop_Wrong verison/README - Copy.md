# PRT405Project
Group Project Repository 

Installation

1. Download the repository and unzip the files. The latest working code can be found in the Smart Shop folder, the old work and work done by whole team can be found in the old folder.

2. If on campus server is accessable the following connection string should be used
	// Connection string to the server fb

3. To setup a local repository
	a. Create a database called "SmartShop" on your sql express server, through SQL server management studio.
	b. add the following connection strings in the web.config file 
		  <add name="DefaultConnection" connectionString=" Server=localhost\SQLEXPRESS; Database=SmartShop; Trusted_Connection=True;Integrated Security=True;" providerName="System.Data.SqlClient" />
		  <add name="SmartShopEntities" connectionString="metadata=res://*/Models.SmartShop.csdl|res://*/Models.SmartShop.ssdl|res://*/Models.SmartShop.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=.\sqlexpress;initial catalog=SmartShop;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" /></connectionStrings>
	c. run the db-setup.sql code on your SmartShop database.
	