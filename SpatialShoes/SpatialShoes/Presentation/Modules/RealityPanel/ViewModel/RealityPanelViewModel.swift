//
//  RealityPanelViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import Combine
import Foundation

@Observable
final class RealityPanelViewModel {
    
    // MARK: - Public Properties
    
    var favoriteShoes: [Shoe] = []
    var isRotating: Bool = false
    var isFavorite: Bool = false
    var showLoader: Bool = false
    var showAlert: Bool = false
    @ObservationIgnored var errorMessage: String?
        
    // MARK: - Private Properties
    
    private let favoriteShoesUseCase: FavoriteShoesUseCase
        
    // MARK: - Initializer
    
    init(favoriteShoesUseCase: FavoriteShoesUseCase) {
        self.favoriteShoesUseCase = favoriteShoesUseCase
    }
    
    // MARK: - Public Functions
    
    func toggleFavorite(_ shoe: Shoe) {
        showLoader = true
        errorMessage = nil

        do {
            try favoriteShoesUseCase.execute(action: isFavorite ? .delete : .save, for: shoe)
            isFavorite.toggle()
            favoriteShoes = favoriteShoesUseCase.favoriteShoes
            showLoader = false
        } catch let error as FavoriteShoesDomainError {
            errorMessage = error.message
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Localizables.unknownError)")
        } catch {
            errorMessage = Localizables.unknownError
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Localizables.unknownError)")
        }
    }
    
    func checkIfFavoriteShoe(with id: Int) {
        isFavorite = favoriteShoes.contains { $0.id == id }
    }
    
    func toggleRotation() {
        isRotating.toggle()
    }
}

// MARK: - Constants

private extension RealityPanelViewModel {
    enum Localizables {
        static let unknownError = "Error por determinar"
    }
}

