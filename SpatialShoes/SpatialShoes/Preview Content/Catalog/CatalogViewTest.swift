//
//  CatalogViewTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

extension CatalogView {
    static var preview: some View {
        let repository = GetShoesRepositoryTest()
        let useCase = GetShoesUseCase(repository: repository)
        
        return CatalogView()
            .environment(CatalogViewModel(getShoesUseCase: useCase))
    }
}
