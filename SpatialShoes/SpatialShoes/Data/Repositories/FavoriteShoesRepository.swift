//
//  FavoriteShoesRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation

final class FavoriteShoesRepository {
    
    // MARK: - Public Functions
    
    func saveFavoriteShoe(_ shoe: Shoe) throws {
        do {
            try SwiftDataManager.shared.saveFavoriteShoe(shoe)
        } catch {
            throw FavoriteShoesDataError.saveError
        }
    }
    
    func deleteFavoriteShoe(with id: Int) throws {
        do {
            try SwiftDataManager.shared.deleteFavoriteShoe(with: id)
        } catch {
            throw FavoriteShoesDataError.deleteError
        }
    }
    
    func fetchFavoriteShoes() throws -> [Shoe] {
        do {
            return try SwiftDataManager.shared.fetchFavoriteShoes()
        } catch {
            throw FavoriteShoesDataError.fetchError
        }
    }
}

// MARK: - FavoriteShoesDataError

enum FavoriteShoesDataError: Error {
    case saveError
    case deleteError
    case fetchError
}
