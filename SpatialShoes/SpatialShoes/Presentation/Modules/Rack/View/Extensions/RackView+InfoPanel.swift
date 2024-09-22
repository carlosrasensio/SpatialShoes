//
//  RackView+InfoPanel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 23/9/24.
//

import SwiftUI

extension RackView {
    @ViewBuilder
    func createInfoPanel(with favoriteShoe: Shoe) -> some View {
        VStack {
            Spacer()
            InfoPanelView(shoe: favoriteShoe)
        }
    }
}
