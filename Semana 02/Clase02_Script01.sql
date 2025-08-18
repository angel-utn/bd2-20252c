Create Database Clase02
go
Use Clase02
Go
Create Table Empleados(
	IDEmpleado int not null,
	Apellidos varchar(255) not null,
	Nombres varchar(255) not null,
	Salario money not null,
	FechaContratacion date not null,
	IDArea smallint null
)
Go
Create Table Areas(
	IDArea smallint not null,
	Nombre varchar(255) not null,
	Mail varchar(255) not null
)
Go
-- Creación de restricciones
Alter Table Empleados
Add Constraint PK_Empleados Primary Key (IDEmpleado)
Go
Alter Table Areas
Add Constraint PK_Areas Primary Key (IDArea)
Go
Alter Table Empleados
Add Constraint CHK_SalarioPositivo Check (Salario > 0)
Go
Alter Table Empleados
Add Constraint FK_EmpleadosAreas Foreign Key (IDArea) 
References Areas(IDArea)

-- Creación de columna
Alter Table Areas
Add Telefono varchar(20) null

-- Modificación de columna
Alter Table Areas
Alter Column Telefono varchar(30) null
