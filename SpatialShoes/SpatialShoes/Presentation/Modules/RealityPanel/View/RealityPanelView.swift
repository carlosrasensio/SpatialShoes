//
//  RealityPanelView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

struct RealityPanelView: View {
    
    // MARK: - Public Properties
    
    @Environment(\.openWindow) var openWindow
    @State var viewModel: RealityPanelViewModel
    var shoe: Shoe
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.showLoader {
                ProgressView(Localizables.loaderText)
            } else {
                createRealityPanel(with: shoe)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue.opacity(0.2))
        .foregroundColor(.white)
        .navigationBarItems(trailing:
                                Button(action: {
            toggleFavorite()
        }) {
            Image(systemName: shoe.isFavorite ? Constants.Icons.deleteFavorite : Constants.Icons.saveFavorite)
                .foregroundColor(.red)
                .font(.title2)
        })
        .overlay(
            Group {
                if viewModel.showFavoriteToast {
                    createToast()
                }
            },
            alignment: .center
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
        shoe.isFavorite.toggle()
        if shoe.isFavorite {
        } else {
        }
        viewModel.toggleFavorite(shoe)
        showFavoriteToast()
    }
    
    func showFavoriteToast() {
        viewModel.showFavoriteToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            viewModel.showFavoriteToast = false
        }
    }
}

// MARK: - Constants

extension RealityPanelView {
    enum Constants {
        
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
        static let loaderText = Global.Localizables.loaderText
        static let showVolumetricWindow = "Ver Ventana Volumétrica"
        static let enableExhibitorMode = "Activar Modo Expositor"
        static let disableExhibitorMode = "Desactivar Modo Expositor"
        static let alertTitle = "Ups..."
        static let unknownError = Global.Localizables.Errors.unknown
    }
}
