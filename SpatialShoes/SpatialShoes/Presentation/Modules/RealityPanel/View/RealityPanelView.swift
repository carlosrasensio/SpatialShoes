//
//  RealityPanelView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import RealityKit
import SpatialShoesScene
import SwiftUI

struct RealityPanelView: View {
    
    // MARK: - Public Properties
    
    @State var viewModel: RealityPanelViewModel
    let shoe: Shoe
    
    // MARK: - Private Properties

    @Environment(\.openWindow) private var openWindow
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.showLoader {
                ProgressView(Localizables.loaderText)
            } else {
                Model3D(named: shoe.model3DName, bundle: spatialShoesSceneBundle) { model in
                    model
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: 0.3, y: 0.3, z: 0.3)
                        .rotation3DEffect(.degrees(viewModel.rotationAngle),
                                          axis: (x: 0, y: 1, z: 0))
                } placeholder: {
                    ProgressView("\(shoe.name) \(Localizables.loaderText.lowercased())")
                }
                
                Button(action: {
                    viewModel.isRotating.toggle()
                }) {
                    Text(viewModel.isRotating ? Localizables.disableExhibitorMode : Localizables.enableExhibitorMode)
                }
                
                Button(Localizables.showVolumetricWindow) {
                    openWindow(id: Constants.volumetricWindowID)
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue.opacity(0.2))
        .foregroundColor(.white)
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
                if viewModel.showFavoriteToast {
                    createToast()
                }
            },
            alignment: .top
        )
        .alert(Localizables.alertTitle,
               isPresented: $viewModel.showAlert)
        {} message: {
            Text(viewModel.errorMessage ?? Localizables.unknownError)
        }
        .onDisappear {
            viewModel.stopRotation()
        }
    }
}

// MARK: - Private Functions

private extension RealityPanelView {
    func toggleFavorite() {
        viewModel.toggleFavorite(shoe)
        viewModel.showFavoriteToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            viewModel.showFavoriteToast = false
        }
    }
}

// MARK: - Constants

private extension RealityPanelView {
    enum Constants {
        static let volumetricWindowID = Global.Constants.shoeVolumetricWindowID
        
        // MARK: - Icons
        
        enum Icons {
            static let saveFavorite = "heart"
            static let deleteFavorite = "heart.fill"
        }
    }
}

// MARK: - Localizables

extension RealityPanelView {
    enum Localizables {
        static let loaderText = "Cargando..."
        static let showVolumetricWindow = "Ver Ventana Volumétrica"
        static let enableExhibitorMode = "Activar Modo Expositor"
        static let disableExhibitorMode = "Desactivar Modo Expositor"
        static let alertTitle = "Ups..."
        static let unknownError = Global.Localizables.unknownError
    }
}
