//
//  DetailView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import RealityKit
import SpatialShoesScene
import SwiftUI

struct DetailView: View {
    
    // MARK: - Public Properties
    
    @ObservedObject var viewModel: DetailViewModel
    var shoe: Shoe
    
    // MARK: - Private Properties
    
    @State private var isPresented: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
//            VStack {
//                Text(shoe.brand)
//                Text(shoe.size)
//                Text(shoe.price)
//                Text(shoe.brand)
//                Text(shoe.description)
//                Text(shoe.type)
//                Text(shoe.materials)
//                Text(shoe.origin)
//                Text(shoe.gender)
//                Text(shoe.weight)
//                Text(shoe.colors)
//                Text(shoe.warranty)
//                Text(shoe.certifications)
//            }

            Model3D(named: shoe.model3DName, bundle: spatialShoesSceneBundle)
                .scaleEffect(x: 0.3, y: 0.3, z: 0.3)

            
            Button(action: {
                viewModel.isRotating.toggle()
            }) {
                Text(viewModel.isRotating ? "Activar Modo Expositor" : "Desactivar Modo Expositor")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.bottom)
            
            Button("Ver Ventana Volumétrica") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                Text(shoe.model3DName)
                Detailed3DView(modelName: shoe.model3DName)
            }
            
            Spacer()
        }
        .navigationBarTitle(shoe.name, displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        viewModel.toggleFavorite(shoe)
                    }) {
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(viewModel.isFavorite ? .red : .gray)
                            .font(.title2)
                    }
                )
    }
}

// MARK: - Preview

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
