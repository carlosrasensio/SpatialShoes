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
    
    @State var viewModel: DetailViewModel
    var shoe: Shoe
    
    // MARK: - Private Properties
    
    @State private var showVolumetricWindow: Bool = false
    @State private var showFavoriteToast: Bool = false
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if viewModel.showLoader {
                    ProgressView(Localizables.loaderText)
                } else {
                    createInfoPanel()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Model3D(named: shoe.model3DName, bundle: spatialShoesSceneBundle)
                        .scaleEffect(x: 0.3, y: 0.3, z: 0.3)
                        .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        viewModel.isRotating.toggle()
                    }) {
                        Text(viewModel.isRotating ? Localizables.disableExhibitorMode : Localizables.enableExhibitorMode)
                    }
                    
                    Button(Localizables.showVolumetricWindow) {
                        showVolumetricWindow.toggle()
                    }
                    .sheet(isPresented: $showVolumetricWindow) {
                        createVolumetricWindow()
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle(shoe.name, displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
            toggleFavorite()
        }) {
            Image(systemName: viewModel.isFavorite ? Constants.Icons.deleteFavorite : Constants.Icons.saveFavorite)
                .foregroundColor(.red)
                .font(.title2)
        })
        .overlay(
            Group {
                if showFavoriteToast {
                    createToast()
                }
            },
            alignment: .topTrailing
        )
        .alert(Localizables.alertTitle,
               isPresented: $viewModel.showAlert)
        {} message: {
            Text(viewModel.errorMessage ?? Localizables.unknownError)
        }
    }
}

// MARK: - Private Functions

private extension DetailView {
    func toggleFavorite() {
        viewModel.toggleFavorite(shoe)
        showFavoriteToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            showFavoriteToast = false
        }
    }
}

// MARK: - Constants

private extension DetailView {
    enum Constants {
        enum Icons {
            static let saveFavorite = "heart"
            static let deleteFavorite = "heart.fill"
        }
    }
}

// MARK: - Localizables

extension DetailView {
    enum Localizables {
        static let loaderText = "Cargando..."
        static let showVolumetricWindow = "Ver Ventana Volumétrica"
        static let enableExhibitorMode = "Activar Modo Expositor"
        static let disableExhibitorMode = "Desactivar Modo Expositor"
        static let unknownError = "Error por determinar"
        static let alertTitle = "Ups..."
    }
}
