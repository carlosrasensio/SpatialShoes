//
//  DetailView_Preview.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import SwiftUI

#Preview {
    let repository = FavoriteShoesRepository()
    let useCase = FavoriteShoesUseCase(repository: repository)
    let viewModel = DetailViewModel(favoriteShoesUseCase: useCase)
    let shoe = Shoe(id: 0,
               name: "Authentic",
               brand: "Vans",
               size: [45],
               price: 60.0,
               description: "Classics!",
               model3DName: "VansAuthentic",
               type: "Casual",
               materials: ["Casual"],
               origin: "USA",
               gender: "Unisex",
               weight: 1.2,
               colors: ["Black", "White", "Red", "Blue"],
               warranty: 1,
               certifications: ["Handmade", "Eco"])
    DetailView(viewModel: viewModel, shoe: shoe)
}
