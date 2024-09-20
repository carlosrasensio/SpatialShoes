//
//  SpatialShoesApp.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

@main
struct SpatialShoesApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        
        WindowGroup(id: "ShoeVolumetricWindow") {
            VolumetricWindowView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
