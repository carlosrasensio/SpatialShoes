//
//  RackView+Shelf.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import RealityKit
import SpatialShoesScene
import SwiftUI

extension RackView {
    @ViewBuilder
    func createShelf(with favoriteShoe: Shoe) -> some View {
        VStack {
            Model3D(named: favoriteShoe.model3DName, bundle: spatialShoesSceneBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 0.3, y: 0.3, z: 0.3)
                    .rotation3DEffect(.degrees(viewModel.rotationAngle),
                                      axis: (x: 0, y: 1, z: 0))
            } placeholder: {
                ProgressView("\(favoriteShoe.name) \(Global.Localizables.loaderText.lowercased())")
            }
            
            Spacer()

            Button(favoriteShoe.name) {
                viewModel.showInfoPanel.toggle()
            }
            .sheet(isPresented: $viewModel.showInfoPanel) {
                VStack {
                    Spacer()
                    InfoPanelView(shoe: favoriteShoe)
                }
            }
        }
        .padding()
    }
}
