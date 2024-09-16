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
    
    private var repository: ShoeDataRepository

    // MARK: - Initializer
    
    init(repository: ShoeDataRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Functions
    
    func loadShoes() {
        showLoader = true
        errorMessage = nil
        
        do {
            shoes = try repository.loadShoes(fileName: Constants.fileName,
                                             bundle: Bundle(for: JSONManager.self))
            showLoader = false
        } catch let error as ShoeDataError {
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

// MARK: - Constants

private extension HomeViewModel {
    enum Constants {
        static let fileName = "Shoes"
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
