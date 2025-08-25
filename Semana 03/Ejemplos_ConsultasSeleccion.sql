Use Libreria_2C
GO

-- Listado de todas las columnas de la tabla de Libros
Select * From Libros;

-- Listado Titulo, Año de publicacion
Select Titulo, AñoPublicacion From Libros;

-- Listado de años de publicación de los libros
Select AñoPublicacion From Libros;

-- Listado de años de publicación sin repetir de los libros
Select Distinct AñoPublicacion From Libros;

-- Listado de cantidad de páginas y años de publicación sin repetir de los libros
Select Distinct Libros.Paginas, Libros.AñoPublicacion From Libros;

/** ALIASES **/
Select Distinct LIB.Titulo, LIB.Descripcion As 'Sinopsis' From Libros As LIB;

-------------
-- ORDER BY
-------------

-- Listado de libros con Titulo, Cantidad de páginas, Año de publicacion ordenado descendentemente por título
Select Titulo, Paginas, AñoPublicacion From Libros
Order By Titulo Desc;

-- Listado de libros con Titulo, Cantidad de páginas, Año de publicacion 
-- ordenado ascendentemente por Año de publicación y, si hay empate, descendentemente por cantidad páginas
Select Titulo, Paginas, AñoPublicacion From Libros
Order by AñoPublicacion Asc, Paginas Desc;

----------
-- TOP
----------

-- Obtener los 4 libros con título más largo
Select Top 4 With Ties IDLibro, Titulo, Len(Titulo) As 'LargoTitulo' From Libros
Order By LargoTitulo Desc;
-- Order By 3 Desc; -- 3 es la tercer columna
-- Order By Len(Titulo) Desc;

-----------
-- WHERE
-----------

-- Obtener los libros cuya categoría sea 1, 3 o 5
Select * From Libros
Where IDCategoria = 1 OR IDCategoria = 3 OR IDCategoria = 5;

 -- Operador IN
 Select * From Libros
 Where IDCategoria IN (1, 3, 5);

-- Listar los usuarios cuyo país no sea "AR" ni "US"
Select * From Usuarios
Where IDPais != 'AR' AND IDPais != 'US';

Select * From Usuarios
Where Not (IDPais = 'AR' OR IDPais = 'US');

-- Operador
Select * From Usuarios
Where IDPAis Not In ('AR', 'US');
 

 -- Mostrar los libros publicados entre 2000 y 2010
Select * From Libros
Where AñoPublicacion >= 2000 AND AñoPublicacion <= 2010;

-- Operacion Between
Select * From Libros
Where AñoPublicacion Between 2000 And 2010;

-- Las lecturas que hayan sido leídas entre el 2019 y 2021
Select * From Lecturas
Where FechaHora >= '01-01-2019' AND FechaHora <= '31-12-2021';

Select * From Lecturas
Where FechaHora BETWEEN '01-01-2019' AND '31-12-2021';

Select * From Lecturas
Where Year(FechaHora) BETWEEN 2019 AND 2021;

-- Year, Month y Day son funciones que devuelven la parte indicada de una fecha.
-- DatePart es una función que devuelve la parte que le indiquemos como parámetro.

-- IS NULL / IS NOT NULL

-- Los autores que no tienen seudónimo (los que tienen seudónimo con NULL)
Select * From Autores
Where Pseudonimo IS NULL;

-- Los autores que sí tienen pseudónimo (los que no tienen seudónimo con NULL)
Select * From Autores
Where Pseudonimo IS NOT NULL;

-- Los autores que tienen pseudónimo y tienen apellido y nombres
Select * From Autores
Where Pseudonimo IS NOT NULL AND Apellidos IS NOT NULL AND Nombres IS NOT NULL;