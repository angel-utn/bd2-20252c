Use Clase02
Go
Create Table TiemposEmpleadosProyecto(
	ID bigint not null primary key identity (1, 1),
	IDEmpleado int not null,
	IDProyecto int not null,
	Fecha date not null,
	MinutosTrabajados smallint not null check (MinutosTrabajados > 0)
)
Go
Alter Table TiemposEmpleadosProyecto
Add Constraint FK_EmpleadoProyecto
Foreign key (IDEmpleado, IDProyecto)
References EmpleadosProyecto(IDEmpleado, IDProyecto)