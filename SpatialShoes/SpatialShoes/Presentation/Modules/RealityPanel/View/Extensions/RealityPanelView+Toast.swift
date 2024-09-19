//
//  RealityPanelView+Toast.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

extension RealityPanelView {
    @ViewBuilder
    func createToast() -> some View {
        Text(viewModel.isFavorite ? Localizables.toastSaveDescription : Localizables.toastDeleteDescription)
            .background(Color.red.opacity(0.1))
            .foregroundColor(.white)
            .cornerRadius(10)
            .transition(.opacity)
    }
}

// MARK: - Localizables

private extension RealityPanelView.Localizables {
    static let toastSaveDescription = "Zapatilla guardada en Favoritos con éxito!"
    static let toastDeleteDescription = "Zapatilla eliminada de Favoritos con éxito!"
}
