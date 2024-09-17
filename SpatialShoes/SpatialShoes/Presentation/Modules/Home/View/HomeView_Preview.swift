//
//  HomeView_Preview.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import SwiftUI

#Preview(windowStyle: .automatic) {
    HomeView(viewModel: HomeViewModel(getShoesUseCase: GetShoesUseCase(repository: GetShoesRepository())))
}
