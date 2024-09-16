//
//  DetailFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 15/9/24.
//

import Foundation

final class DetailFactory {
    static func make(with shoe: Shoe) -> DetailView {
        .init(viewModel: makeDetailViewModel(), shoe: shoe)
    }
}

// MARK: - Private Functions

private extension DetailFactory {
    static func makeDetailViewModel() -> DetailViewModel {
        .init(favoriteShoesUseCase: makeFavoriteShoesUseCase())
    }
    
    static func makeFavoriteShoesUseCase() -> FavoriteShoesUseCase {
        .init(repository: makeFavoriteShoesRepository())
    }
    
    static func makeFavoriteShoesRepository() -> FavoriteShoesRepository {
        FavoriteShoesRepository()
    }
}
