//
//  ShoeDTO+.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 21/9/24.
//

extension ShoeDTO {
    var toShoe: Shoe {
        Shoe(id: id,
             name: name,
             brand: brand,
             size: size,
             price: price,
             descriptionString: description,
             model3DName: model3DName,
             type: type,
             materials: materials,
             origin: origin,
             gender: gender,
             weight: weight,
             colors: colors,
             warranty: warranty,
             certifications: certifications)
    }
}
