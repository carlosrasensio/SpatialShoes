//
//  GetShoesRepositoryTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

final class GetShoesRepositoryTest {}

// MARK: - GetShoesRepositoryProtocol

extension GetShoesRepositoryTest: GetShoesRepositoryProtocol {
    
    // MARK: - Properties
    
    var fileName: String? { "ShoesTest" }
    var bundle: Bundle? { Bundle(for: GetShoesRepositoryTest.self) }
}

// MARK: - HomeView

extension HomeView {
    static var preview: some View {
        let repository = GetShoesRepositoryTest()
        let useCase = GetShoesUseCase(repository: repository)
        let viewModel = HomeViewModel(getShoesUseCase: useCase)
        
        return HomeView(viewModel: viewModel)
    }
}
