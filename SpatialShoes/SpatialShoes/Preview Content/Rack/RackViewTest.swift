//
//  RackViewTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 19/9/24.
//

import SwiftUI

extension RackView {
    static var preview: some View {
        let shoes = [Shoe.test,
                     Shoe.test,
                     Shoe.test,
                     Shoe.test]
        
        return RackView(favoriteShoes: shoes, onSelect: { shoe in
            print("ℹ️ Seleccionada zapatilla \(shoe.name) - \(shoe.brand)")
        })
    }
}
