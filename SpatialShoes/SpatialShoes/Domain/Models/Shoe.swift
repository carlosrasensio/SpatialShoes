//
//  Shoe.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

struct Shoe: Codable, Identifiable {
    let id: Int
    let name: String
    let brand: String
    let size: [Int]
    let price: Double
    let description: String
    let model3DName: String
    let type: String
    let materials: [String]
    let origin: String
    let gender: String
    let weight: Double
    let colors: [String]
    let warranty: Int
    let certifications: [String]
}
