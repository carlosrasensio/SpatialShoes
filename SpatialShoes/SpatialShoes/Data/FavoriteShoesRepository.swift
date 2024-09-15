//
//  FavoriteShoesRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation

final class FavoriteShoesRepository {
    
    // MARK: - Public Functions

    func fetchFavoriteShoes() throws -> [Shoe] {
        try SwiftDataManager.shared.fetchFavoriteShoes()
    }
    
    func saveFavoriteShoe(_ shoe: Shoe) throws {
        try SwiftDataManager.shared.saveFavoriteShoe(shoe)
    }
    
    func removeFavoriteShoe(with id: Int) throws{
        try SwiftDataManager.shared.removeFavoriteShoe(with: id)
    }
}
