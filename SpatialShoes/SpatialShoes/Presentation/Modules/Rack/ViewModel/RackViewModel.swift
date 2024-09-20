//
//  RackViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import Foundation

@Observable
final class RackViewModel {
    
    // MARK: - Public Properties
    
    var favoriteShoes: [Shoe] = []
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
    
    func getFavoriteShoes() {
        do {
            try favoriteShoesUseCase.execute(action: .fetch)
            favoriteShoes = favoriteShoesUseCase.favoriteShoes
        } catch let error as FavoriteShoesDomainError {
            errorMessage = error.message
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Global.Localizables.unknownError)")
        } catch {
            errorMessage = Global.Localizables.unknownError
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Global.Localizables.unknownError)")
        }
    }
}
