# SpatialShoes

**SpatialShoes** es una aplicación desarrollada para visionOS, utilizando **SwiftUI** y **RealityKit**, que permite a los usuarios explorar modelos 3D de zapatos en una experiencia inmersiva y envolvente. La aplicación muestra un catálogo interactivo donde los modelos 3D pueden ser manipulados libremente, vistos en modo expositor, y explorados en detalle en una ventana volumétrica.

## Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Funcionalidades](#funcionalidades)
- [Arquitectura](#arquitectura)

## Requisitos

- **Xcode 15** o superior.
- **visionOS SDK**.
- Conocimientos básicos de **SwiftUI** y **RealityKit**.
- Dispositivo compatible con visionOS (ej., Apple Vision Pro).

## Instalación

1. Clona el repositorio:

    ```bash
    git clone https://github.com/tu_usuario/spatial-shoes.git
    ```

2. Abre el proyecto en Xcode:

    ```bash
    cd spatial-shoes
    open SpatialShoes.xcodeproj
    ```

3. Instala las dependencias necesarias y ejecuta el proyecto en un simulador compatible con visionOS o en un dispositivo real.

## Estructura del Proyecto

- **Models**: Contiene el archivo `Shoe.swift` que define la estructura de datos del zapato.
- **ViewModels**: Implementación de la lógica de negocio y enlace entre modelos y vistas (MVVM).
- **Views**: Contiene las vistas de SwiftUI para la interfaz de usuario.
- **Reality Assets**: Recursos 3D (`.usdz`) y escenas de Reality Composer Pro.
- **Resources**: Archivo `Shoes.json` con la información del catálogo de zapatos.

## Funcionalidades

1. **Catálogo de Zapatos**: Muestra una lista de todos los modelos de zapatos con información detallada.
2. **Manipulación 3D**: Permite rotar y acercar los modelos de zapatos en una vista de "visión libre".
3. **Modo Expositor**: Visualización automática con rotación continua de los modelos 3D.
4. **Favoritos**: Marcado de modelos favoritos y visualización en un layout tipo estantería.
5. **Exploración Inmersiva**: Carrusel de zapatos con botones de "Siguiente" y "Anterior" para una experiencia de exploración envolvente.
6. **Ventana Volumétrica**: Visualización detallada de cada zapato en una ventana volumétrica interactiva.

## Arquitectura

Siguiendo las recomendaciones de Apple, se ha utilizado una arquitectura MMVM apoyandose en las bases de Clean Architecture.