//
//  DetailView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI
import RealityKit
import SpatialShoesScene

struct DetailView: View {
    
    // MARK: - Public Properties
    
    let shoe: Shoe
    
    // MARK: - Private Properties

    @State private var isPresented: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            Text(shoe.name)
                .font(.largeTitle)
                .padding()

            Model3D(named: shoe.model3DName, bundle: spatialShoesSceneBundle)
                .scaleEffect(x: 0.3, y: 0.3, z: 0.3)
            
            Button("Ver en ventana volumétrica") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                // TODO: Detailed 3D View
                Text(shoe.model3DName)
            }
            
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    DetailView(shoe: Shoe(id: 0,
                   name: "Authentic",
                   brand: "Vans",
                   size: [45],
                   price: 60.0,
                   description: "Classics!",
                   model3DName: "VansAuthentic",
                   type: "Casual",
                   materials: ["Casual"],
                   origin: "USA",
                   gender: "Unisex",
                   weight: 1.2,
                   colors: ["Black", "White", "Red", "Blue"],
                   warranty: 1,
                   certifications: ["Handmade", "Eco"]))
}
