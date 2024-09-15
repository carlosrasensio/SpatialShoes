//
//  FavoriteShoesUseCase.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation

final class FavoriteShoesUseCase {

    // MARK: - Private Properties
    
    private var repository: FavoriteShoesRepository
    
    // MARK: - Initializer

    init(repository: FavoriteShoesRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Funtions
    
    func fetchFavoriteShoes() throws -> [Shoe] {
        try repository.fetchFavoriteShoes()
    }
    
    func saveFavoriteShoe(_ shoe: Shoe) throws {
       try repository.saveFavoriteShoe(shoe)
    }
    
    func removeFavoriteShoe(with id: Int) throws {
        try repository.removeFavoriteShoe(with: id)
    }
}
