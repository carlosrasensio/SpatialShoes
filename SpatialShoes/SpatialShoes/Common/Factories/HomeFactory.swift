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
        .init(repository: makeShoeDataRepository())
    }
    
    static func makeShoeDataRepository() -> ShoeDataRepository {
        ShoeDataRepository()
    }
}
