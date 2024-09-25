//
//  CatalogViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

@Observable
final class CatalogViewModel {
    
    // MARK: - Public Properties
    
    var shoes: [Shoe] = []
    var selectedShoe: Shoe?
    var showLoader: Bool = false
    var showAlert: Bool = false
    @ObservationIgnored var errorMessage: String = ""
    
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
            print("❌ [ERROR] \(error.localizedDescription)")
        } catch {
            errorMessage = Localizables.Errors.unknown
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(error.localizedDescription)")
        }
    }
}

// MARK: - Localizables

private extension CatalogViewModel {
    enum Localizables {
        enum Errors {
            static let unknown = "Error por determinar"
        }
    }
}
