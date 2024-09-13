//
//  JSONManagerTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import XCTest
@testable import SpatialShoes

final class JSONManagerTests: XCTestCase {
    func testLoadShoesFromJSONSuccess() throws {
        // Given
        let fileName = "ShoesTest"
        let bundle = Bundle(for: ShoeDataRepositoryTests.self)

        // When
        guard let shoes: [Shoe] = try JSONManager.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else {
            XCTFail("❌ Error decoding JSON file")
            return
        }
        
        // Then
        XCTAssertFalse(shoes.isEmpty, "The Shoes.json file should contain at least one shoe.")
        
        guard let firstShoe = shoes.first else {
            XCTFail("❌ No shoes were found in the uploaded data.")
            return
        }
        
        XCTAssertEqual(firstShoe.name, "Urban Explorer")
        XCTAssertEqual(firstShoe.brand, "UrbanStride")
        XCTAssertEqual(firstShoe.price, 99.99)
        XCTAssertEqual(firstShoe.size, [38, 39, 40, 41, 42])
        XCTAssertEqual(firstShoe.model3DName, "leatherShoes")
    }
}
