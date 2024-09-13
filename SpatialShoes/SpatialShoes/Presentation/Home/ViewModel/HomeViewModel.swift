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
    
    var shoes: [Shoe]
    
    // MARK: - Private Properties
    
    private var repository: ShoeDataRepositoryProtocol

    // MARK: - Initializer
    
    init(repository: ShoeDataRepositoryProtocol = ShoeDataRepository()) {
        self.repository = repository
        do {
            shoes = try repository.loadShoes()
        } catch {
            shoes = []
            print("❌ Error decoding JSON: \(error.localizedDescription)")
        }
    }
}
