# SpatialShoes

**SpatialShoes** es una aplicación inmersiva desarrollada para **visionOS** que permite a los usuarios explorar y manipular modelos 3D de zapatillas de manera intuitiva. Usando **SwiftUI** y **RealityKit**, los usuarios pueden interactuar con un catálogo de zapatillas, marcar favoritos y experimentar una visualización volumétrica detallada. La aplicación se organiza utilizando la arquitectura **MVVM** en combinación con **Clean Architecture**, empleando **SwiftData** para la persistencia de datos.

## Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Funcionalidades](#funcionalidades)
- [Modelo de Datos](#modelo-de-datos)
- [Modelos 3D](#modelos-3D)
- [Diseño de Interfaz](#diseño-de-interfaz)
- [Arquitectura](#arquitectura)
- [Testing](#testing)
- [Futuras Mejoras](#futuras-mejoras)

## Requisitos

- Desarrolado en **Xcode 15** o superior.
- **visionOS SDK**.
- Conocimientos básicos de **SwiftUI**, **RealityKit** y **SwiftData**.
- Dispositivo compatible con visionOS (ej. Apple Vision Pro o Xcode Simulator).

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

## Estructura del Proyecto

- **Models**: Contiene la representación de los datos, incluyendo `ShoeDTO.swift` y `Shoe.swift` para la definición de una zapatilla y otros modelos relacionados.
- **ViewModels**: Controladores de la lógica de negocio que conectan los modelos con las vistas siguiendo el patrón MVVM.
- **Views**: Vistas de **SwiftUI** que definen la interfaz de usuario.
- **Reality Assets**: Modelos 3D en formato `.usdz` y escenas de Reality Composer Pro.
- **Persistence**: Lógica relacionada con **SwiftData** para la persistencia de datos.
- **Resources**: Archivo `Shoes.json` con la información del catálogo de zapatillas.

## Funcionalidades

1. **Catálogo de Zapatillas**: Lista interactiva de modelos 3D de zapatillas, donde se muestra información detallada de cada una.
2. **Manipulación 3D**: Rotación y zoom libre en los modelos de zapatillas.
3. **Modo Expositor**: Visualización continua de los modelos en rotación automática.
4. **Favoritos**: Marcado de zapatillas favoritas y presentación en una vista tipo estantería.
5. **Ventana Volumétrica**: Visualización ampliada e interactiva de cada zapatilla, utilizando una ventana volumétrica para mayor detalle.
6. **Persistencia**: Uso de **SwiftData** para el almacenamiento de datos.

## Modelo de Datos

Los datos de los zapatillas se cargan desde un archivo `Shoes.json`. Adicionalmente, el marcado de favoritos se guarda en una base de datos utilizando **SwiftData**.

## Diseño de Interfaz

La interfaz sigue las pautas de diseño de [Apple para visionOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos) y utiliza componentes de **SwiftUI**. Además, se ha implementado un layout tipo estantería para la visualización de los zapatillas favoritos, proporcionando una experiencia de usuario visualmente atractiva.

## Arquitectura

El proyecto utiliza una arquitectura **MVVM** (Model-View-ViewModel) en combinación con principios de **Clean Architecture**, desacoplando las responsabilidades entre vistas, lógica de presentación y lógica de negocio. Cada módulo se divide en:

- **View**: Vistas construidas con SwiftUI.
- **ViewModel**: Gestiona la lógica de presentación, actuando como intermediario entre las vistas y los datos.
- **UseCases**: Se encargan de la lógica de negocio central y las interacciones con el repositorio.
- **Repositories**: Acceden a los datos, ya sea desde archivos locales como `Shoes.json` o desde servicios de persistencia **SwiftData**, aunque en nuestro caso no ha sido necesario.

## Testing

El proyecto incluye una serie de test unitarios para validar el correcto funcionamiento de la aplicación. Se utilizan simulaciones de datos para asegurarse de que la lógica de la aplicación funciona correctamente en diferentes escenarios.

## Futuras Mejoras

**Interacción en Realidad Aumentada**: Permitir la visualización de los zapatillas en entornos del mundo real usando ARKit.


