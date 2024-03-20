![image](https://github.com/aqualinqs/Databases/assets/151569483/30ed2983-6277-4708-8c7b-5352f8f7ba83)# PostgreSQL Docker Project using Northwind Database

About the Database
The Northwind database is a verastile database originated by Microsoft. It has been well adapted for use by various non-microsoft databases including MySQl and PostgreSQL. Within the Northwind database lies the sales data of the fictional enterprise "Northwind Traders," engaged in the global import and export of specialty foods.
It contains the entities below:
- Suppliers: Suppliers and vendors of Northwind
- Customers: Customers who buy products from Northwind
- Employees: Employee details of Northwind traders
- Products: Product information
- Categories: Product Categories
- Shippers: The details of the shippers who ship the products from the traders to the end customers
- Orders and Order_Details: Sales Order transactions taking place between the customers & thecompany
- Regions and Territories: Geo information
- Suppliers: Suppliers' information

Using the Northwind dataset, I genereated SQL queries in PostgreSQL.
After designing the database and schema, I run the postgreSQL database in docker to generated a docker compose (YAML) file.
Then i set-up A container in the YAML file.

