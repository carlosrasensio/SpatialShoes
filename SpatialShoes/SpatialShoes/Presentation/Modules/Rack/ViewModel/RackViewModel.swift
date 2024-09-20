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
    
    var favoriteShoes: [Shoe] = [Shoe.test, Shoe.test, Shoe.test, Shoe.test]
    var showLoader: Bool = false
    var showInfoPanel: Bool = false
    var showAlert: Bool = false
    @ObservationIgnored var errorMessage: String?
    
    // MARK: - Private Properties
    
    private let favoriteShoesUseCase: FavoriteShoesUseCase
    private var rotationTimer: Timer?
    var rotationAngle: Double = 0.0
    
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
            print("❌ [ERROR] \(errorMessage ?? Global.Localizables.Errors.unknown)")
        } catch {
            errorMessage = Global.Localizables.Errors.unknown
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Global.Localizables.Errors.unknown)")
        }
    }
    
    func startRotation() {
        rotationTimer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.rotationAngle += 1.0
            if self.rotationAngle >= 360 {
                self.rotationAngle = 0
            }
        }
    }
}
