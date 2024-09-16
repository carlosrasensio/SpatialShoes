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
    @Published var errorMessage: String?
    @Published var showLoader: Bool = false
    @Published var showAlert: Bool = false
        
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
            try favoriteShoesUseCase.execute(action: isFavorite ? .delete : .save, shoe: shoe)
            isFavorite.toggle()
            favoriteShoes = favoriteShoesUseCase.favoriteShoes
            showLoader = false
        } catch let error as DomainError {
            switch error {
            case .inputError:
                errorMessage = "Error al obtener la información de la zapatilla"
            case .saveError:
                errorMessage = "Error guardando la zapatilla en Favoritos"
            case .deleteError:
                errorMessage = "Error borando la zapatilla de Favoritos"
            case .fetchError:
                errorMessage = "Error obteniendo las zapatillas de Favoritos"
            }
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Constants.unknownError)")
        } catch {
            errorMessage = Constants.unknownError
            showLoader = true
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Constants.unknownError)")
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
    enum Constants {
        static let unknownError = "Error por determinar"
    }
}
