-- Consultas de acción: Insertar, modificar o eliminar
Use Clase02
Go
-- INSERT
-- Inserta registros de a uno a la vez
Insert into Areas(IDArea, Nombre, Mail)
Values (100, 'Sistemas', 'sistemas@mail.com');

Insert into Areas(IDArea, Nombre, Mail)
Values (200, 'Recursos Humanos', 'rrhh@mail.com');

-- Insertar registros de a varios a la vez
Insert into Areas(IDArea, Nombre, Mail, Telefono)
Values 
(300, 'Contable', 'contable@mail.com', '1234'),
(400, 'Legales', 'legales@mail.com', '9658'),
(500, 'Tesoreria', 'tesoreria@mail.com', null);

-- UPDATE
Update Areas Set Nombre = 'IT', Mail = 'it@mail.com' Where IDArea = 100;

-- DELETE
Delete From Areas Where IDArea = 400 Or IDArea = 500;
