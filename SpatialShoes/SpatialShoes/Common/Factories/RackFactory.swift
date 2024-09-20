//
//  RackFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import Foundation

final class RackFactory {
    static func make() -> RackView {
        .init(viewModel: makeRackViewModel())
    }
}

// MARK: - Private Functions

private extension RackFactory {
    static func makeRackViewModel() -> RackViewModel {
        .init(favoriteShoesUseCase: makeFavoriteShoesUseCase())
    }
    
    static func makeFavoriteShoesUseCase() -> FavoriteShoesUseCase {
        .init(repository: makeFavoriteShoesRepository())
    }
    
    static func makeFavoriteShoesRepository() -> FavoriteShoesRepository {
        FavoriteShoesRepository()
    }
}
