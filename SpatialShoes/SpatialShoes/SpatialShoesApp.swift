//
//  SpatialShoesApp.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI
import SwiftData

@main
struct SpatialShoesApp: App {
    
    // MARK: - Private Properties

    @State private var catalogViewModel = CatalogFactory.makeCatalogViewModel()
        
    private var modelContainer: ModelContainer = {
        let schema = Schema([Shoe.self ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("❌ [ERROR] No se pudo crear el ModelContainer: \(error.localizedDescription)")
        }
    }()
 

    // MARK: - View
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(catalogViewModel)
        }
        .modelContainer(modelContainer)
        
        WindowGroup(id: Global.Constants.shoeVolumetricWindowID) {
            VolumetricWindowView()
                .environment(catalogViewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
