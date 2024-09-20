//
//  SpatialShoesApp.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

@main
struct SpatialShoesApp: App {
    
    // MARK: - Private Properties

    @State private var catalogViewModel = CatalogFactory.makeCatalogViewModel()

    // MARK: - View
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(catalogViewModel)
        }
        
        WindowGroup(id: Global.Constants.shoeVolumetricWindowID) {
            VolumetricWindowView()
                .environment(catalogViewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
