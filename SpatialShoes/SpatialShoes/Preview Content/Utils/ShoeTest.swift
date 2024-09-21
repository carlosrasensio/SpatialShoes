//
//  ShoeTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

extension Shoe {
    static let test = Shoe(id: 10345,
                           name: "Sporty Chic",
                           brand: "EleganceWalk",
                           size: [36, 37, 38, 39, 40],
                           price: 89.99,
                           descriptionString: """
            Descubre el estilo y la comodidad con nuestras **Sporty Chic** de **EleganceWalk**. Diseñadas para las mujeres activas que no quieren sacrificar el estilo por la funcionalidad, estas zapatillas deportivas femeninas ofrecen una combinación perfecta de rendimiento y elegancia. Ideales para actividades deportivas y para el uso diario.
            
            **Características Destacadas:**
            - **Material:** Tejidos y materiales sintéticos de alta calidad que garantizan transpirabilidad y durabilidad.
            - **Diseño:** Estilo moderno y femenino que se adapta a cualquier atuendo deportivo.
            - **Comodidad:** Suela ergonómica y plantilla acolchada para un confort superior en cada paso.
            - **Versatilidad:** Perfectas para correr, entrenar o simplemente para un look deportivo casual, disponibles en varias tallas.
            
            Realza tu rendimiento y tu estilo con nuestras **Sporty Chic** y marca la diferencia en cada paso.
            """,
                           model3DName: "fashionSportShoe",
                           type: "Deportivas",
                           materials: ["Sintético", "Textil"],
                           origin: "Estados Unidos",
                           gender: "Unisex",
                           weight: 0.8,
                           colors: ["Rojo", "Blanco", "Negro"],
                           warranty: 2,
                           certifications: ["Materiales Reciclados", "Libre de Crueldad"],
                           isFavorite: false)
}
