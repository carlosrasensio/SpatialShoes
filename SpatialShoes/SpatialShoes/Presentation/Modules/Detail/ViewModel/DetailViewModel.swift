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
    @Published var showLoader: Bool = false
    @Published var showAlert: Bool = false
    var errorMessage: String?
        
    // MARK: - Private Properties
    
    private var favoriteShoesUseCase: FavoriteShoesUseCase
        
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

private extension DetailViewModel {
    enum Localizables {
        static let unknownError = "Error por determinar"
    }
}
