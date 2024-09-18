//
//  MockGetShoesRepository.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import Foundation
@testable import SpatialShoes

final class MockGetShoesRepository {}

// MARK: - GetShoesRepositoryProtocol

extension MockGetShoesRepository: GetShoesRepositoryProtocol {
    
    // MARK: - Properties
    
    var fileName: String? { "ShoesTest" }
    var bundle: Bundle? { Bundle(for: MockGetShoesRepository.self) }
}
