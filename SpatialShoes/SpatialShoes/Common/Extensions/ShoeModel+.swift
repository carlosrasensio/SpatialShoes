//
//  ShoeModel+.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 21/9/24.
//

extension ShoeModel {
    var toShoe: Shoe {
        Shoe(id: id,
             name: name,
             brand: brand,
             size: size,
             price: price,
             description: descriptionString,
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
