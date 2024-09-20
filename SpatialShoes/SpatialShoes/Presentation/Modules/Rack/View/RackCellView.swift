//
//  RackCellView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 19/9/24.
//

import RealityKit
import SpatialShoesScene
import SwiftUI

struct RackCellView: View {
    
    // MARK: - Properties

    let shoe: Shoe
    
    // MARK: - View

    var body: some View {
        VStack {
            Model3D(named: shoe.model3DName, bundle: spatialShoesSceneBundle)
                .frame(width: 50, height: 50)
                .scaleEffect(x: 0.3, y: 0.3, z: 0.3)
                .clipped()
            
            Text(shoe.name)
                .font(.caption)
                .lineLimit(1)
        }
        .padding()
    }
}
