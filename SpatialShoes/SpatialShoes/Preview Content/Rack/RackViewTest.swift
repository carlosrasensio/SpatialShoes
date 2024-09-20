//
//  RackViewTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 19/9/24.
//

import SwiftUI

extension RackView {
    static var preview: some View {
        let repository = FavoriteShoesRepository()
        let useCase = FavoriteShoesUseCase(repository: repository)
        let viewModel = RackViewModel(favoriteShoesUseCase: useCase)
        let shoes = [Shoe.test,
                     Shoe.test,
                     Shoe.test,
                     Shoe.test]
        
        return RackView(viewModel: viewModel)
    }
}
