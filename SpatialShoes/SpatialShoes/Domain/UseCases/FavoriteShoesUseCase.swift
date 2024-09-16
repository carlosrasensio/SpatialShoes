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
        guard let shoe else { throw DomainError.inputError }
        
        do {
            switch action {
            case .save:
                try saveFavoriteShoe(shoe)
            case .delete:
                try deleteFavoriteShoe(with: shoe.id)
            case .fetch:
                favoriteShoes = try fetchFavoriteShoes()
            }
        } catch let error as FavoriteShoesDataError {
            throw error.mapToDomainError()
        }
    }
}

// MARK: - Private Functions

private extension FavoriteShoesUseCase {
    func saveFavoriteShoe(_ shoe: Shoe) throws {
        try repository.saveFavoriteShoe(shoe)
    }
    
    func deleteFavoriteShoe(with id: Int) throws {
        try repository.deleteFavoriteShoe(with: id)
    }
    
    func fetchFavoriteShoes() throws -> [Shoe] {
        try repository.fetchFavoriteShoes()
    }
}

// MARK: - DomainError

enum DomainError: Error {
    case inputError
    case saveError
    case deleteError
    case fetchError
}

// MARK: - FavoriteShoesDataError

private extension FavoriteShoesDataError {
    func mapToDomainError() -> DomainError {
        switch self {
        case .saveError: .saveError
        case .deleteError: .deleteError
        case .fetchError: .fetchError
        }
    }
}
