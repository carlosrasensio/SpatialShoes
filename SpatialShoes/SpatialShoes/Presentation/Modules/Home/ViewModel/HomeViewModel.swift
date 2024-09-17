//
//  HomeViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

@Observable
final class HomeViewModel {
    
    // MARK: - Public Properties
    
    var shoes: [Shoe] = []
    var showLoader: Bool = false
    var showAlert: Bool = false
    var errorMessage: String = ""
    
    // MARK: - Private Properties
    
    private var getShoesUseCase: GetShoesUseCase

    // MARK: - Initializer
    
    init(getShoesUseCase: GetShoesUseCase) {
        self.getShoesUseCase = getShoesUseCase
    }
    
    // MARK: - Public Functions
    
    func loadShoes() {
        showLoader = true
        
        do {
            try getShoesUseCase.execute()
            shoes = getShoesUseCase.shoes
            showLoader = false
        } catch let error as GetShoesDomainError {
            errorMessage = error.message
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(errorMessage)")
        } catch {
            errorMessage = Localizables.Errors.unknown
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(errorMessage)")
        }
    }
}

// MARK: - Localizables

private extension HomeViewModel {
    enum Localizables {
        enum Errors {
            static let unknown = "Error por determinar"
        }
    }
}
