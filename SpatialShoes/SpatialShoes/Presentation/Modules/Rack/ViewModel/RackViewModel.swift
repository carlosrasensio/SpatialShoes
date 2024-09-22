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
    var showInfoPanel: Bool = false
    var isRotating: Bool = false
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
    
    /// NOTA 1: En este caso, esta función no se llama desde la vista y el caso de uso no tiene funcionalidad, ya que la persistencia con SwifData se realiza desde las propias vistas. En un principio estaba pensado para utilizar UseCase, Repository y SwiftDataManager, pero no se ha terminado de desarrollar la idea. En este módulo es más claro, ya que con la propiedad Query de SwiftData es muy sencilla la obtención de los datos persistidos.
    /// NOTA 2: Se ha dejado el código básicamente para dejar reflejado el trabajo planteado, así como el manejo de errores. Además de que en esta función se gestiona el funcionamiento del loader.
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
}

// MARK: - Model3DRotation

extension RackViewModel: Model3DRotation {
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
