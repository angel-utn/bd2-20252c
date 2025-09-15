Use Libreria_2C;

-----------------------------
-- Subconsultas escalares
-----------------------------

-- El promedio de páginas del los libros
Select avg(Paginas * 1.00) From Libros; -- 372.787500

-- Los libros y la cantidad de páginas
Select Lib.Titulo, Lib.Paginas from Libros Lib;

-- Los libros que tienen más páginas que el promedio de páginas
Select Lib.Titulo, Lib.Paginas from Libros Lib
Where Lib.Paginas > (Select avg(Paginas * 1.00) From Libros);

-- Resuelto con una variable (NO ES SUBCONSULTAS)
Declare @PaginasPromedio decimal(7, 2);
Set @PaginasPromedio = (Select avg(Paginas * 1.00) From Libros);

Select Lib.Titulo, Lib.Paginas from Libros Lib
Where Lib.Paginas > @PaginasPromedio;


-- Por cada usuario, listar nombre de usuario y la cantidad de libros leídos en el año 2020 y la cantidad de libros leídos en el 2021.

/*
    NombreUsuario       CantLibros2020      CantLibros2021
    ------------------------------------------------------
    pepito              10                  15
    laura               35                  32
*/

Select 
  U.IDUsuario,
  U.NombreUsuario,
  (
    Select count(distinct LEC.IDLibro) From Lecturas LEC
    Where Year(Lec.FechaHora) = 2020 And Lec.IDUsuario = U.IDUsuario
  ) As CantLibros2020,
  (
    Select count(distinct LEC.IDLibro) From Lecturas LEC
    Where Year(Lec.FechaHora) = 2021 And Lec.IDUsuario = U.IDUsuario
  ) As CantLibros2021

From Usuarios U;


--------------------------------
-- Subconsultas de una columna
--------------------------------

-- Los libros que tienen más páginas que cualquier libro de categoría 'Historia'. Debe tener más páginas que el libro de 'Historia' con más páginas. Debe tener más páginas que todos los libros de Historia.

-- Subconsulta: Las páginas de todos los libros de Historia
Select Lib.Paginas From Libros Lib
Inner Join Categorias Cat ON Lib.IDCategoria = Cat.IDCategoria
Where Cat.Categoria like 'Historia';


-- Solución

Select Titulo, Paginas From Libros
Where Paginas > ALL (
  Select Lib.Paginas From Libros Lib
  Inner Join Categorias Cat ON Lib.IDCategoria = Cat.IDCategoria
  Where Cat.Categoria like 'Historia' 
);


-- Los libros que no fueron leídos en el año 2023 por usuarios de Argentina.
Select * From Libros
Where IDLibro Not In (
  Select distinct L.IDLibro From Usuarios U
  Inner Join Paises P ON P.IDPais = U.IDPais
  Inner Join Lecturas L ON L.IDUsuario = U.IDUsuario
  Where P.Pais = 'Argentina' And Year(L.FechaHora) = 2023
)

Select * From Libros
Where IDLibro <> ALL (
  Select distinct L.IDLibro From Usuarios U
  Inner Join Paises P ON P.IDPais = U.IDPais
  Inner Join Lecturas L ON L.IDUsuario = U.IDUsuario
  Where P.Pais = 'Argentina' And Year(L.FechaHora) = 2023
)

------------------------------------
-- Subconsultas de Varias Columnas
------------------------------------

-- Los usuarios que hayan leído más libros en el 2021 que en el 2020 pero que hayan leído libros en ambos años.
Select 
  EstadisticasLectura.NombreUsuario,
  EstadisticasLectura.CantLibros2020,
  EstadisticasLectura.CantLibros2021
 From (
  Select 
  U.IDUsuario,
  U.NombreUsuario,
  (
    Select count(distinct LEC.IDLibro) From Lecturas LEC
    Where Year(Lec.FechaHora) = 2020 And Lec.IDUsuario = U.IDUsuario
  ) As CantLibros2020,
  (
    Select count(distinct LEC.IDLibro) From Lecturas LEC
    Where Year(Lec.FechaHora) = 2021 And Lec.IDUsuario = U.IDUsuario
  ) As CantLibros2021
  From Usuarios U

) EstadisticasLectura
Where
EstadisticasLectura.CantLibros2021 > EstadisticasLectura.CantLibros2020
And EstadisticasLectura.CantLibros2020 > 0;

-- CTE (Common Table Expression)
With EstadisticasLectura As (
  Select 
  U.IDUsuario,
  U.NombreUsuario,
  (
    Select count(distinct LEC.IDLibro) From Lecturas LEC
    Where Year(Lec.FechaHora) = 2020 And Lec.IDUsuario = U.IDUsuario
  ) As CantLibros2020,
  (
    Select count(distinct LEC.IDLibro) From Lecturas LEC
    Where Year(Lec.FechaHora) = 2021 And Lec.IDUsuario = U.IDUsuario
  ) As CantLibros2021
  From Usuarios U
)

Select * From EstadisticasLectura
Where CantLibros2021 > CantLibros2020 And CantLibros2020 > 0