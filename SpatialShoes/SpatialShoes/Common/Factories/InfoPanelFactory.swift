//
//  InfoPanelFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import Foundation

final class InfoPanelFactory {
    static func make(with shoe: Shoe) -> InfoPanelView {
        .init(shoe: shoe)
    }
}
