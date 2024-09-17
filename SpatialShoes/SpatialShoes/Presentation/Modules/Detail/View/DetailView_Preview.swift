//
//  DetailView_Preview.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import SwiftUI

#Preview {
    DetailView(viewModel: DetailViewModel(favoriteShoesUseCase: FavoriteShoesUseCase(repository: FavoriteShoesRepository())),
               shoe: Shoe(id: 0,
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
                          certifications: ["Handmade", "Eco"]))
}
