Use Libreria_2C;

/* Obtener el libro cuyo título sea 'It' */
Select * From Libros Where Titulo = 'It';
Select * From Libros Where Titulo Like 'It';

/* Obtener los títulos de los libros que comiencen con 'The' */
Select * From Libros Where Titulo Like 'The%';

/* Obtener los usuarios cuyo nombre de usuario incluya "A" */
Select * From Usuarios Where NombreUsuario Like '%A%';

/* ¿Qué nos devuelve esto? NombreUsuario like '%A_A%' */
Select * From Usuarios Where NombreUsuario Like '%A_A%';

/* Obtener los títulos de los libros que comiencen con vocal */
Select * from Libros where Titulo Like '[aeiou]%';

/* Obtener los títulos de los libros que comiencen con vocal,
continúen con uno de estos caracteres: lpf y finalicen con cualquier carácter o texto */
Select * from Libros where Titulo Like '[aeiou][lpf]%';

/* Obtener los títulos de los libros que comiencen con vocal,
continúen con un carácter en el rango entre b y m, y finalicen con cualquier carácter o texto */
Select * from Libros where Titulo Like '[aeiou][b-m]%';

/*Obtener los libros cuyos títulos no comiencen con vocal ni números */
Select * from Libros where Titulo Like '[^aeiou123456790]%';