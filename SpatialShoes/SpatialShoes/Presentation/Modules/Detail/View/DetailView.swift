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
        ScrollView {
            VStack(spacing: 20) {
                createInfoPanel()
                    .frame(maxWidth: .infinity, alignment: .leading)

                Model3D(named: shoe.model3DName, bundle: spatialShoesSceneBundle)
                    .scaleEffect(x: 0.3, y: 0.3, z: 0.3)
                    .frame(maxWidth: .infinity)

                Button(action: {
                    viewModel.isRotating.toggle()
                }) {
                    Text(viewModel.isRotating ? "Desactivar Modo Expositor" : "Activar Modo Expositor")
                }

                Button("Ver Ventana Volumétrica") {
                    isPresented.toggle()
                }
                .sheet(isPresented: $isPresented) {
                    createVolumetricWindow()
                }

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle(shoe.name, displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                viewModel.toggleFavorite(shoe)
            }) {
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .font(.title2)
            }
        )
    }
}
