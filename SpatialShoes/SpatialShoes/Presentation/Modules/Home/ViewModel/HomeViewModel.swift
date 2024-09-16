//
//  HomeViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    var shoes: [Shoe] = []
    @Published var errorMessage: String?
    @Published var showLoader: Bool = false
    @Published var showAlert: Bool = false
    
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
            switch error {
            case .filenameError:
                errorMessage = Localizables.fileNameError
            case .bundleError:
                errorMessage = Localizables.bundleError
            case .parsingError(let fileName):
                errorMessage = String(format: Localizables.parsingError, fileName)
            }
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Localizables.unknownError)")
        } catch {
            errorMessage = Localizables.unknownError
            showLoader = false
            showAlert = true
            print("❌ [ERROR] \(errorMessage ?? Localizables.unknownError)")
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
        static let fileNameError = "Error con el nombre del fichero JSON"
        static let bundleError = "Error con el bundle"
        static let parsingError = "Error cargando el fichero '%@.json'"
        static let unknownError = "Error por determinar"
    }
}
