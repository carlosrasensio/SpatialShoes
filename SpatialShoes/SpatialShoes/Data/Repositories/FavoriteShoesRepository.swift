//
//  FavoriteShoesRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation


/// NOTA 1: En este caso, esta claseno tiene funcionalidad, ya que la persistencia con SwifData se realiza desde las propias vistas. En un principio estaba pensado para utilizar UseCase, Repository y SwiftDataManager, pero no se ha terminado de desarrollar la idea.
/// NOTA 2: Se ha dejado el código básicamente para dejar reflejado el trabajo planteado, así como el manejo de errores.
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
