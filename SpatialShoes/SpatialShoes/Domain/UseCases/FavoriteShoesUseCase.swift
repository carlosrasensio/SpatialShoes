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
    
    private let repository: FavoriteShoesRepository
    
    // MARK: - Initializer

    init(repository: FavoriteShoesRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Funtions
    
    func execute(action: FavoriteShoeAction, for shoe: Shoe? = nil) throws {
        guard let shoe else { throw FavoriteShoesDomainError.inputError }
        
        do {
            switch action {
            case .save:
                try saveFavoriteShoe(shoe)
            case .delete:
                try deleteFavoriteShoe(with: shoe.id)
            case .fetch:
                favoriteShoes += try fetchFavoriteShoes()
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
        favoriteShoes.append(shoe)
    }
    
    func deleteFavoriteShoe(with id: Int) throws {
        try repository.deleteFavoriteShoe(with: id)
        favoriteShoes.removeAll { $0.id == id }
    }
    
    func fetchFavoriteShoes() throws -> [Shoe] {
        try repository.fetchFavoriteShoes()
    }
}

// MARK: - FavoriteShoesDomainError

enum FavoriteShoesDomainError: Error {
    case inputError
    case saveError
    case deleteError
    case fetchError
    
    var message: String {
        switch self {
        case .inputError: Localizables.Errors.input
        case .saveError: Localizables.Errors.save
        case .deleteError: Localizables.Errors.delete
        case .fetchError: Localizables.Errors.fetch
        }
    }
}

// MARK: - FavoriteShoesDomainError.Localizables

private extension FavoriteShoesDomainError {
    enum Localizables {
        enum Errors {
            static let input = "Error al obtener la información de la zapatilla"
            static let save = "Error guardando la zapatilla en Favoritos"
            static let delete = "Error borando la zapatilla de Favoritos"
            static let fetch = "Error obteniendo las zapatillas de Favoritos"
        }
    }
}

// MARK: - FavoriteShoesDataError

private extension FavoriteShoesDataError {
    func mapToDomainError() -> FavoriteShoesDomainError {
        switch self {
        case .saveError: .saveError
        case .deleteError: .deleteError
        case .fetchError: .fetchError
        }
    }
}
