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
    
    // MARK: - Private Properties
    
    private var repository: ShoeDataRepository

    // MARK: - Initializer
    
    init(repository: ShoeDataRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Functions
    
    func loadShoes() {
        do {
            shoes = try repository.loadShoes(fileName: Constants.fileName,
                                             bundle: Bundle(for: JSONManager.self))
        } catch let error as ShoeDataError {
            switch error {
            case .wrongFileName:
                errorMessage = "Error con el nombre del fichero JSON"
            case .wrongBundle:
                errorMessage = "Error con el bundle"
            case .parsingError(let fileName):
                errorMessage = "Error cargando el fichero '\(fileName).json'"
            }
            print("❌ [ERROR] \(errorMessage ?? Constants.unknownError)")
        } catch {
            errorMessage = Constants.unknownError
            print("❌ [ERROR] \(errorMessage ?? Constants.unknownError)")
        }
    }
}

// MARK: - Constants

private extension HomeViewModel {
    enum Constants {
        static let fileName = "Shoes"
        static let unknownError = "Error por determinar"
    }
}
