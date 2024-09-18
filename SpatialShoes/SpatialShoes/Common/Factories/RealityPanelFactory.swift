//
//  RealityPanelFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation

final class RealityPanelFactory {
    static func make(with shoe: Shoe) -> RealityPanelView {
        .init(viewModel: makeRealityPanelViewModel(), shoe: shoe)
    }
}

// MARK: - Private Functions

private extension RealityPanelFactory {
    static func makeRealityPanelViewModel() -> RealityPanelViewModel {
        .init(favoriteShoesUseCase: makeFavoriteShoesUseCase())
    }
    
    static func makeFavoriteShoesUseCase() -> FavoriteShoesUseCase {
        .init(repository: makeFavoriteShoesRepository())
    }
    
    static func makeFavoriteShoesRepository() -> FavoriteShoesRepository {
        FavoriteShoesRepository()
    }
}
