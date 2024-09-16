//
//  FavoriteShoesUseCase.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation

enum FavoriteShoeAction {
    case save
    case delete
    case fetch
}

final class FavoriteShoesUseCase {

    // MARK: - Public Properties

    @Published var favoriteShoes: [Shoe] = []
    
    // MARK: - Private Properties
    
    private var repository: FavoriteShoesRepository
    
    // MARK: - Initializer

    init(repository: FavoriteShoesRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Funtions
    
    func execute(action: FavoriteShoeAction, shoe: Shoe? = nil) throws {
        switch action {
        case .save:
            guard let shoe else { return }
            try saveFavoriteShoe(shoe)
        case .delete:
            guard let shoe else { return }
            try deleteFavoriteShoe(with: shoe.id)
        case .fetch:
            favoriteShoes = try fetchFavoriteShoes()
        }
    }
}

// MARK: - Private Functions

private extension FavoriteShoesUseCase {
    func fetchFavoriteShoes() throws -> [Shoe] {
        try repository.fetchFavoriteShoes()
    }
    
    func saveFavoriteShoe(_ shoe: Shoe) throws {
       try repository.saveFavoriteShoe(shoe)
    }
    
    func deleteFavoriteShoe(with id: Int) throws {
        try repository.deleteFavoriteShoe(with: id)
    }
}
