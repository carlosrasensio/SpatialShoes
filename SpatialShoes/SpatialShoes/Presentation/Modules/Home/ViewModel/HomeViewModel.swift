//
//  HomeViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var showLoader: Bool = false
    @Published var showAlert: Bool = false
    var shoes: [Shoe] = []
    var errorMessage: String?
    
    // MARK: - Private Properties
    
    private var getShoesUseCase: GetShoesUseCase

    // MARK: - Initializer
    
    init(getShoesUseCase: GetShoesUseCase) {
        self.getShoesUseCase = getShoesUseCase
    }
    
    // MARK: - Public Functions
    
    func loadShoes() {
        showLoader = true
        errorMessage = nil
        
        do {
            try getShoesUseCase.execute()
            shoes = getShoesUseCase.shoes
            showLoader = false
        } catch let error as GetShoesDomainError {
            errorMessage = error.message
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Localizables.Errors.unknown)")
        } catch {
            errorMessage = Localizables.Errors.unknown
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Localizables.Errors.unknown)")
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
