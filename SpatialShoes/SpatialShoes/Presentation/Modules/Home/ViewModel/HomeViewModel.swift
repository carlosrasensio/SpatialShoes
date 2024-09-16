//
//  HomeViewModel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

@Observable
final class HomeViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    var shoes: [Shoe]
    
    // MARK: - Private Properties
    
    private var repository: ShoeDataRepository

    // MARK: - Initializer
    
    init(repository: ShoeDataRepository) {
        self.repository = repository
        do {
            shoes = try repository.loadShoes(fileName: Constants.fileName)
        } catch {
            shoes = []
            print("❌ Error decoding JSON: \(error.localizedDescription)")
        }
    }
}

// MARK: - Constants

private extension HomeViewModel {
    enum Constants {
        static let fileName = "Shoes"
    }
}
