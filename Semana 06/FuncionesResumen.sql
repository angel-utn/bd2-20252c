Use Libreria_2C;

-- Funciones de resumen
----------------------------

-- Count: Cantidad elementos de la lista de parámetros.
-- Uso:

-- Select count(*) as 'CantLibros' From Libros; // 10, 5, 10, NULL
-- Select count(IdCategoria) From Libros; // 10, 5, 10, NULL
-- Select count(distinct IdCategoria) From Libros; // 10, 5, 10, NULL
-- Select count(*) From Libros Where AñoPublicacion = 2005; --> 0

-- Max: El valor más grande de la lista de parámetros
-- Min: El valor más chico de la lista de parámetros

-- Select Max(FechaPublicacion) From Libros;
-- Select Min(Paginas) From Libros;

-- [Funciones valores numéricos]
-- Avg: Promedio de valores numéricos de la lista de parámetros
-- Select avg(Paginas) From Libros;

Select Avg(Cast(Paginas as decimal)) From libros;

Select Avg(Paginas * 1.00) From libros;

-- Sum: Suma de valores numéricos de la lista de parámetros
-- Select Sum(Paginas) From Libros Where IdCategoria = 1;

Select Sum(Paginas) As 'TotalPaginasCat1' From Libros Where IdCategoria = 1;

-- Nombre de categoría, suma de páginas x categoría
----------------------------------------------------
-- Terror           1049
-- Ciencia ficción  4309
-- Bélica  4309


----------------
-- Group By
----------------
-- Resumir pero agrupando por uno o varios criterios

Select 
  CAT.Categoria,
  LIB.AñoPublicacion, 
  SUM(LIB.Paginas) as TotalPaginas,
  Count(*) As Cantidad
From Categorias As CAT
Inner Join Libros as LIB ON CAT.IDCategoria = LIB.IDCategoria
Group By CAT.Categoria, LIB.AñoPublicacion;

-- Por cada usuario, la cantidad de libros que leyó y la cantidad de veces que leyó libros (sesiones de lectura).
Select 
  U.NombreUsuario,
  Count(Distinct LEC.IDLibro) As CantLibros,
  Count(LEC.IDLectura) As CantLecturas
From Usuarios U 
Inner Join Lecturas LEC ON U.IDUsuario = LEC.IDUsuario
Group By U.NombreUsuario;

----------------
-- Having
----------------
-- Aplicar un filtro al resultado de una función de resumen

-- Por cada usuario, la cantidad de libros que leyó y la cantidad de veces que leyó libros (sesiones de lectura).
-- Solamente de los libros que pertenezcan a los medios con ID 9 y 10.
-- Solamente mostrar aquellos registros de usuarios que leyeron más de 8 libros.
-- Ordenar el resultado por CantLecturas de forma descendente

Select 
  U.NombreUsuario,
  Count(Distinct LEC.IDLibro) As CantLibros,
  Count(LEC.IDLectura) As CantLecturas
From Usuarios U 
Inner Join Lecturas LEC ON U.IDUsuario = LEC.IDUsuario
Where LEC.IDMedio Between 9 AND 10
Group By U.NombreUsuario
Having Count(Distinct LEC.IDLibro) > 8
Order By CantLecturas Desc;