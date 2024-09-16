//
//  DetailViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Combine
import Foundation

final class DetailViewModel: ObservableObject {
    
    // MARK: - Public Properties

    @Published var isRotating = false
    @Published var isFavorite = false
    @Published var favoriteShoes: [Shoe] = []
        
    // MARK: - Private Properties
    
    private var favoriteShoesUseCase: FavoriteShoesUseCase
        
    // MARK: - Initializer
    
    init(favoriteShoesUseCase: FavoriteShoesUseCase) {
        self.favoriteShoesUseCase = favoriteShoesUseCase
    }
    
    // MARK: - Public Functions
    
    func toggleFavorite(_ shoe: Shoe) {
        do {
            if isFavorite {
                try favoriteShoesUseCase.removeFavoriteShoe(with: shoe.id)
            } else {
                try favoriteShoesUseCase.saveFavoriteShoe(shoe)
            }
            isFavorite.toggle()
        } catch {
            // TODO: Show alert
            print("❌ Error in [toggleFavorite]: \(error.localizedDescription)")
        }
    }
    
    func checkIfFavoriteShoe(with id: Int) {
        isFavorite = favoriteShoes.contains { $0.id == id }
    }
    
    func toggleRotation() {
        isRotating.toggle()
    }
}
