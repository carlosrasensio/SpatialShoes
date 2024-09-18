//
//  DetailViewTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

extension RealityPanelView {
    static var preview: some View {
        let repository = FavoriteShoesRepository()
        let useCase = FavoriteShoesUseCase(repository: repository)
        let viewModel = RealityPanelViewModel(favoriteShoesUseCase: useCase)
        
        return RealityPanelView(viewModel: viewModel, shoe: Shoe.test)
    }
}


