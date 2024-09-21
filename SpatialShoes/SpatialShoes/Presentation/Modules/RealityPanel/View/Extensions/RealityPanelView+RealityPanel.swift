//
//  RealityPanelView+RealityPanel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import RealityKit
import SpatialShoesScene
import SwiftUI

extension RealityPanelView {
    @ViewBuilder
    func createRealityPanel(with shoe: Shoe) -> some View {
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

// MARK: - Constants

private extension RealityPanelView.Constants {
    static let volumetricWindowID = Global.Constants.shoeVolumetricWindowID
}
