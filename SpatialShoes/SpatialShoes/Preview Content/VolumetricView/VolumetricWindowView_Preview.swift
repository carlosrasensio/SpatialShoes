//
//  VolumetricWindowView_Preview.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import SwiftUI

#Preview(windowStyle: .volumetric,
         traits: .fixedLayout(width: 1.0, height: 1.0, depth: 1.0),
         body: {
    let repository = GetShoesRepositoryTest()
    let useCase = GetShoesUseCase(repository: repository)
    
    return VolumetricWindowView()
        .environment(HomeViewModel(getShoesUseCase: useCase))
})
