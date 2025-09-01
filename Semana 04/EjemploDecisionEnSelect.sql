Use Libreria_2C;

-- Decisión: Dentro de la consulta

/* Obtener títulos de los libros y una columna llamada longitud con las siguientes características:
Corto - Si el libro tiene hasta 100 páginas
Estándar - Si el libro tiene entre 100 y 500
Largo - Si el libro tiene entre 501 y 1000
Extenso - Si el libro tiene más de 1000 páginas */

Select Titulo, Paginas, 
  Case
  When Paginas < 100 Then 'Corto'
  When Paginas between 100 And 500 Then 'Estándar'
  When Paginas between 501 And 1000 Then 'Largo'
  Else 'Extenso'
  End As Longitud
From Libros