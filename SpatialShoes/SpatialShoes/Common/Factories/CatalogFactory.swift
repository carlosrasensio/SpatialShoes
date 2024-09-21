//
//  CatalogFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class CatalogFactory {
    static func make() -> CatalogView {
        CatalogView()
    }
    
    static func makeCatalogViewModel() -> CatalogViewModel {
        .init(getShoesUseCase: makeGetShoesUseCase())
    }
}

// MARK: - Private Functions

private extension CatalogFactory {
    static func makeGetShoesUseCase() -> GetShoesUseCase {
        .init(repository: makeGetShoesRepository())
    }
    
    static func makeGetShoesRepository() -> GetShoesRepositoryProtocol {
        GetShoesRepository()
    }
}
