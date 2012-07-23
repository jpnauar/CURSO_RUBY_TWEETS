CURSO_RUBY_TWEETS
=================

Taller Curso Ruby

Trending Topic
--------------
La aplicación persiste en una base de datos MySql los trends, twits y users. Se cuenta con un link en la página principal, que al hacer clic trae los trending topic de la api de twitter. Se listan los últimos 10 Trending Topic obtenidos de la api de Twitter. Cada trend se lista con un link relacionado que permite acceder a sus twits.
La primera vez que se accede a los twits, los va a buscar a la api de Twitter y al mismo tiempo busca los usuarios relacionados; todo el conjunto es persistido en este momento en la base de datos, los twits y los users. Cuando se accede a la pantalla de los twitts se muestran los últimos 10 twits ordenados del trend; y para cada uno, el usuario que lo posteo con su link relacionado y si el texto del twit tiene una url, se lista la url  y el título de la página de la url.
La segunda vez que se accede a los twits, la aplicación ira sobre los datos persistidos en la base de datos (salvo dos consideración descrita más abajo).
 
Consideraciones:
----------------
Texto de la Url
De la url me traigo solo el título dado que considere traer solo información genérica de la página (se puede haber traído más información, por falta de tiempo no he podido).
Como hay una limitante de 150 consultas a la api por hora considere que: 
Los trends que me quedaban con menos de 10 twits, si se volvía a acceder al twit, iba nuevamente a la API a buscar los twitts faltantes (en caso de que hubieran los lista) (se puede probar de forma rápida borrando los twits un trend y que queden menos de 10).
Puede suceder que un twit quede sin usuario si justo coincide que la consulta 151 es la búsqueda del usuario para el twit. En este caso, cuando se vuelve a acceder a un twit, recorre la base de datos buscado, para los twit del trend, si existe algún user_id = nil, si existe, actualiza el usuario llamando a la API (se puede probar de forma rápida borrando un id de usuario en la base de datos y luego entrando al twit o refrescando la página).


