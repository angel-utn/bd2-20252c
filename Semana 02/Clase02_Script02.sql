Use Clase02
Go
Create Table PresupuestosAnualesAreas(
	IDArea smallint not null,
	Año smallint not null,
	Presupuesto money not null check (Presupuesto >= 0),
	foreign key (IdArea) references Areas(IDArea),
	primary key (IDArea, Año)
)
Go
Create Table Proyectos(
	IDProyecto int not null primary key identity(1, 1),
	Nombre varchar(255) not null
)
Go
Create Table EmpleadosProyecto(
	IDEmpleado int not null foreign key references Empleados(IDEmpleado),
	IDProyecto int not null foreign key references Proyectos(IDProyecto),
	primary key (IDEmpleado, IDProyecto)
)