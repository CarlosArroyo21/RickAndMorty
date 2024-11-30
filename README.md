# RickAndMorty
Una aplicación desarrollada en Flutter que utiliza la API de Rick & Morty para mostrar una lista de personajes y permitir la gestión de favoritos.

# 🚀 Cómo ejecutar la aplicación
Sigue los pasos a continuación para ejecutar esta aplicación localmente:

# Instala Flutter 
Asegúrate de tener Flutter instalado en tu máquina. Puedes seguir las instrucciones de instalación en Flutter.dev.

# Instala git
Asegúrate de tener Git instalado en tu máquina. Puedes seguir las instrucciones de instalación en Git.com.

Clona este repositorio con los siguientes comandos:

    git clone https://github.com/CarlosArroyo21/RickAndMorty.git
    cd RickAndMorty


# Instala las dependencias del proyecto
En la raíz del proyecto, ejecuta:

    flutter pub get

# Genera los archivos necesarios con build_runner
Este proyecto utiliza generadores de código como mobx_codegen y hive_ce_generator. Ejecútalos con el siguiente comando:

    flutter pub run build_runner build --delete-conflicting-outputs

# Ejecuta la aplicación
Conecta un emulador o dispositivo físico y ejecuta:

    flutter run

# 🛠️ Arquitectura y decisiones técnicas
La aplicación está construida siguiendo los principios de Clean Architecture. 
Esto ayuda a mantener un código modular, escalable y fácil de probar.

# Estructura de carpetas

core: Contiene utilidades generales y configuraciones como la inyección de dependencias y constantes.

features: Dividida en submódulos por funcionalidad. Cada módulo sigue la estructura:

    data: Implementación de repositorios, modelos y llamadas a la API.
    domain: Entidades y casos de uso.
    presentation: Stores (MobX) y widgets relacionados con la UI.

# Paquetes utilizados
go_router: Manejo de rutas y navegación con soporte para rutas declarativas.
flutter_mobx y mobx: Gestión del estado reactivo y observación de cambios en tiempo real.
flutter_map: Visualización de mapas interactivos.
hive_ce y hive_ce_flutter: Almacenamiento local para persistencia de datos (personajes favoritos).
get_it: Inyección de dependencias para desacoplar componentes.
http: Realización de solicitudes HTTP.
latlong2: Manejo de coordenadas geográficas en mapas.
Decisiones técnicas:
Gestión del estado: Se utilizó MobX para aprovechar la programación reactiva y manejar de manera eficiente el estado de la aplicación.
Inyección de dependencias: Se implementó GetIt para lograr un alto grado de desacoplamiento entre los diferentes niveles de la arquitectura.
Persistencia local: Los personajes marcados como favoritos se almacenan localmente usando Hive, permitiendo que estos datos se mantengan incluso si la aplicación se reinicia.

# ✨ Funcionalidades implementadas
Visualización de personajes de la API de Rick & Morty con paginación.
Gestión de favoritos con persistencia local.
Navegación a través de pantallas usando rutas declarativas con go_router.
Visualización de mapas con marcadores para Bogotá y Valledupar, utilizando flutter_map.

# 🌐 API utilizada
Esta aplicación consume datos de la API de Rick and Morty.
