//
//  MainView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CatalogView()
                .tabItem {
                    Label(Global.Localizables.catalog, systemImage: "house")
                }
            
            RackFactory.make()
                .tabItem {
                    Label(Global.Localizables.favorites, systemImage: "heart")
                }
        }
        .background(Color.blue.opacity(0.4))
        .foregroundColor(.white)
    }
}
