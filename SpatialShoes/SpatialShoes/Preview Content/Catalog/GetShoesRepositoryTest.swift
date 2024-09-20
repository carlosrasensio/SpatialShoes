//
//  GetShoesRepositoryTest.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

final class GetShoesRepositoryTest {}

// MARK: - GetShoesRepositoryProtocol

extension GetShoesRepositoryTest: GetShoesRepositoryProtocol {
    
    // MARK: - Properties
    
    var fileName: String? { "ShoesTest" }
    var bundle: Bundle? { Bundle(for: GetShoesRepositoryTest.self) }
}
