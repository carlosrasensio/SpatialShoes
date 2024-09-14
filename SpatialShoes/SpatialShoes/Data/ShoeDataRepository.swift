//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class ShoeDataRepository {
    func loadShoes(fileName: String,
                   bundle: Bundle = Bundle(for: JSONManager.self)) throws -> [Shoe] {
        try JSONManager.load(fileName: fileName, type: [Shoe].self, bundle: bundle) ?? []
    }
}
