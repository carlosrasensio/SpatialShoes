//
//  HomeFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class HomeFactory {
    static func make() -> HomeView {
        .init(viewModel: makeHomeViewModel())
    }
}

// MARK: - Private Functions

private extension HomeFactory {
    static func makeHomeViewModel() -> HomeViewModel {
        .init(getShoesUseCase: makeGetShoesUseCase())
    }
    
    static func makeGetShoesUseCase() -> GetShoesUseCase {
        .init(repository: makeGetShoesRepository())
    }
    
    static func makeGetShoesRepository() -> GetShoesRepository {
        GetShoesRepository()
    }
}
