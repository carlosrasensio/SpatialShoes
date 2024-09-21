//
//  SwiftDataManager.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 16/9/24.
//

import SwiftData

/// NOTA 1: En este caso, esta claseno tiene funcionalidad, ya que la persistencia con SwifData se realiza desde las propias vistas. En un principio estaba pensado para utilizar UseCase, Repository y SwiftDataManager, pero no se ha terminado de desarrollar la idea.
/// NOTA 2: Se ha dejado el código básicamente para dejar reflejado el trabajo planteado.
final class SwiftDataManager {
    
    // MARK: - Public Properties
    
    static let shared = SwiftDataManager()
    
    // MARK: - Public Functions
    
    func saveFavoriteShoe(_ shoe: Shoe) throws {
        // content.insert(shoe)
    }
    
    func deleteFavoriteShoe(with id: Int) throws {
        // content.delete(shoe)
    }
    
    func fetchFavoriteShoes() throws -> [Shoe] {
        // content.fetch(...)
        []
    }
}
