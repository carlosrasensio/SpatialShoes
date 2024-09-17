//
//  MockGetShoesRepository.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import Foundation
@testable import SpatialShoes

final class MockGetShoesRepository: GetShoesRepositoryProtocol {
    var bundle: Bundle? { Bundle(for: GetShoesUseCaseTests.self) }
    
    func loadShoes(fileName: String?) throws -> [Shoe] {
        guard let fileName else { throw GetShoesDataError.filenameError }
        guard let result = try JSONManager.shared.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else { throw GetShoesDataError.parsingError }
        return result
    }
}
