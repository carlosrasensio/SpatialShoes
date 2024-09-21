//
//  Shoe.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 21/9/24.
//

import SwiftData

@Model
final class Shoe {
    
    // MARK: - Properties
    
    @Attribute(.unique) var id: Int
    var name: String
    var brand: String
    var size: [Int]
    var price: Double
    var descriptionString: String
    var model3DName: String
    var type: String
    var materials: [String]
    var origin: String
    var gender: String
    var weight: Double
    var colors: [String]
    var warranty: Int
    var certifications: [String]
    var isFavorite: Bool
    
    // MARK: - Initializer

    init(id: Int,
         name: String,
         brand: String,
         size: [Int],
         price: Double,
         descriptionString: String,
         model3DName: String,
         type: String,
         materials: [String],
         origin: String,
         gender: String,
         weight: Double,
         colors: [String],
         warranty: Int,
         certifications: [String],
         isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.brand = brand
        self.size = size
        self.price = price
        self.descriptionString = descriptionString
        self.model3DName = model3DName
        self.type = type
        self.materials = materials
        self.origin = origin
        self.gender = gender
        self.weight = weight
        self.colors = colors
        self.warranty = warranty
        self.certifications = certifications
        self.isFavorite = isFavorite
    }
}
