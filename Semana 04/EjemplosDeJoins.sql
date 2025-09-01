-- Inner Join
/* Listado con: título, año publicación, páginas y nombre de categorías de libros. */

Select L.Titulo, L.AñoPublicacion, L.Paginas, C.Categoria 
From Libros As L
Inner Join Categorias As C ON L.IDCategoria = C.IDCategoria;

/* Listado que tenga los siguientes datos de libros: título, cantidad de páginas y, además, nombres,
apellidos y seudónimos de sus autores. */

Select Lib.Titulo, Lib.Paginas, Aut.Apellidos, Aut.Nombres, Aut.Pseudonimo
From Libros As Lib
Inner Join AutoresLibro As AxL ON Lib.IDLibro = AxL.IDLibro
Inner Join Autores As Aut ON Aut.IDAutor = AxL.IDAutor;

/* Listado con: apellidos y nombres de los autores, títulos y años de publicación de los libros.
Si hay autores sin libros asociados mostrarlos igual en el listado. */

Select Aut.Apellidos, Aut.Nombres, Aut.Pseudonimo, Lib.Titulo, Lib.AñoPublicacion
From Autores Aut 
Left Join AutoresLibro As AxL ON Aut.IDAutor = AxL.IDAutor
Left Join Libros As Lib ON Lib.IDLibro = AxL.IDLibro;

/* Listado con: apellidos y nombres de los autores o pseudónimo si no tiene apellido y nombres como nombre de columna Autor, 
títulos y años de publicación de los libros.
Si hay autores sin libros asociados mostrarlos igual en el listado. */

-- IsNull (Expresion, ReemplazoSiExpresionIsNull)
-- Coalesce (Expresion1, Expresion2, Expresion3 ... )

Select 
ISNULL(Aut.Apellidos + ', ' + Aut.Nombres, IsNull(Aut.Pseudonimo, 'Anónimo')) As AutorConIsNull,
Coalesce(Aut.Apellidos + ', ' + Aut.Nombres, Aut.Pseudonimo, 'Anónimo') As Autor,
Lib.Titulo, Lib.AñoPublicacion
From Autores Aut 
Left Join AutoresLibro As AxL ON Aut.IDAutor = AxL.IDAutor
Left Join Libros As Lib ON Lib.IDLibro = AxL.IDLibro;

/* Listado de libros y su categoría. Si una categoría no tiene relacionado un libro incluirla en el listado. */

Insert into Categorias (Categoria) Values ('Bases de datos');

Select L.Titulo, L.AñoPublicacion, L.Paginas, C.Categoria 
From Libros As L 
Right Join Categorias As C ON L.IDCategoria = C.IDCategoria;

/* Listado de categorías que no tienen libros */
Select C.Categoria 
From Libros As L 
Right Join Categorias As C ON L.IDCategoria = C.IDCategoria
Where L.IDLibro Is Null;

-- Cross Join --> Producto Cartesiano
Select Lib.Titulo, Cat.Categoria
From Libros Lib
Cross Join Categorias Cat;