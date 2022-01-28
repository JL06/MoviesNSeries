# MoviesNSeries

## Aplicacion que usa la base de datos de themoviedb.org

Se alimenta de las peliculas y series mostrando las mejor votadas, las favoritas del usuario y recomendaciones

## Estructura

Esta formada por otros frameworks que brindan toda la funcionalidad para que la app unicamente se encargue de mostrar toda la informacion
Contra de los siguientes frameworks

### MoviesTvSeriesFramework
Es el framework que une a los demas componentes y tiene la logica para brindar la informacion necesaria a la aplicacion principal

Ubicacion: https://github.com/JL06/MoviesTvSeriesFramework

### ApiConFramework
Es el framework encargado de realizar las peticiones url

Ubicacion: https://github.com/JL06/ApiConFramework

### PersistenciaCDFramework
Es el framework encargado de almacenar informacion mediante el uso de Core Data

Ubicacion: https://github.com/JL06/PersistenciaCDFramework

### SeguridadFramework
Es el framework encargado de cifrar y descifrar informacion

Ubicacion: https://github.com/JL06/SeguridadFramework

### MoviesSeriesDominioFramework
Es el framework que tiene la informacion de los modelos de datos asi como las urls de donde se encuentra la informacion de estos

Ubicacion: https://github.com/JL06/MoviesSeriesDominioFramework

## Estado actual

Actualmente el proyecto no se encuentra concluido y se tiene conocimiento de algunas fallas y posibles mejoras, sin embargo se encuentra
en un estado estable en el que obtiene la informacion de la base de datos y es capaz de mostrarla, pero no realiza el almacenamiento de datos
ni es capaz de mostrar detalles de los elementos asi como la recomendacion de alguno.
