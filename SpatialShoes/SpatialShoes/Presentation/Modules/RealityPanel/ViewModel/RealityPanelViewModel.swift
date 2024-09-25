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
    
    var showFavoriteToast: Bool = false
    var showLoader: Bool = false
    var isRotating: Bool = false {
        didSet {
            if isRotating {
                startRotation()
            } else {
                stopRotation()
            }
        }
    }
    var rotationAngle: Double = 0.0
    var showAlert: Bool = false
    @ObservationIgnored var errorMessage: String?
        
    // MARK: - Private Properties
    
    private let favoriteShoesUseCase: FavoriteShoesUseCase
    private var rotationTimer: Timer?
        
    // MARK: - Initializer
    
    init(favoriteShoesUseCase: FavoriteShoesUseCase) {
        self.favoriteShoesUseCase = favoriteShoesUseCase
    }
    
    // MARK: - Public Functions
    
    func toggleFavorite(_ shoe: Shoe) {
        showLoader = true
        errorMessage = nil

        do {
            /// NOTA 1: En este caso el caso de uso no tiene funcionalidad, ya que la persistencia con SwifData se realiza desde las propias vistas. En un principio estaba pensado para utilizar UseCase, Repository y SwiftDataManager, pero no se ha terminado de desarrollar la idea.
            /// NOTA 2: Se ha dejado el código básicamente para dejar reflejado el trabajo planteado, así como el manejo de errores. Además de que en esta función se gestiona el funcionamiento del loader.
            try favoriteShoesUseCase.execute(action: shoe.isFavorite ? .save : .delete, for: shoe)
            showLoader = false
        } catch let error as FavoriteShoesDomainError {
            errorMessage = error.message
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(error.localizedDescription)")
        } catch {
            errorMessage = Global.Localizables.Errors.unknown
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(error.localizedDescription)")
        }
    }
    
    func stopRotation() {
        rotationTimer?.invalidate()
        rotationTimer = nil
    }
}

// MARK: - Model3DRotation

extension RealityPanelViewModel: Model3DRotation {
    func startRotation() {
        stopRotation()
        rotationTimer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.rotationAngle += 2.0
            if self.rotationAngle >= 360 {
                self.rotationAngle = 0
            }
        }
    }
}
