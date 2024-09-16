//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class ShoeDataRepository {
    func loadShoes(fileName: String?, bundle: Bundle?) throws -> [Shoe] {
        guard let fileName else { throw ShoeDataError.wrongFileName }
        guard let bundle else { throw ShoeDataError.wrongBundle }
        guard let result = try JSONManager.shared.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else { throw ShoeDataError.parsingError(fileName: fileName) }
        return result
    }
}

// MARK: - ShoeDataError

enum ShoeDataError: Error {
    case wrongFileName
    case wrongBundle
    case parsingError(fileName: String)
}
