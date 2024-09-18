//
//  HomeViewTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

extension HomeView {
    static var preview: some View {
        let repository = GetShoesRepositoryTest()
        let useCase = GetShoesUseCase(repository: repository)
        let viewModel = HomeViewModel(getShoesUseCase: useCase)
        
        return HomeView(viewModel: viewModel)
    }
}
