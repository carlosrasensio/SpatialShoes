//
//  SwiftDataManager.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 16/9/24.
//

final class SwiftDataManager {
    
    // MARK: - Public Properties
    
    static let shared = SwiftDataManager()
    
    // MARK: - Public Functions
    
    func fetchFavoriteShoes() throws -> [Shoe] {
        // TODO
        []
    }
    
    func saveFavoriteShoe(_ shoe: Shoe) throws {
        // TODO
    }
    
    func removeFavoriteShoe(with id: Int) throws {
        var favoriteShoes = try fetchFavoriteShoes()
        favoriteShoes.removeAll { $0.id == id }
        // TODO: Guardar resultado
    }
}
