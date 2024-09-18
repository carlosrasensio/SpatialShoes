//
//  ShoeDataRepositoryTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import XCTest
@testable import SpatialShoes

final class GetShoesRepositoryTests: XCTestCase {
    
    // MARK: - Pivate Properties
    
    private var sut: GetShoesRepositoryProtocol!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        sut = GetShoesRepository()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testLoadShoesWithSuccess() {
        do {
            // When
            let shoes = try sut.loadShoes()
            
            // Then
            XCTAssertNotNil(shoes)
            XCTAssertFalse(shoes.isEmpty)
            
            guard let firstShoe = shoes.first else {
                XCTFail("No se encontró ningún zapato en los datos cargados.")
                return
            }
            
            XCTAssertEqual(firstShoe.name, "Urban Explorer")
            XCTAssertEqual(firstShoe.brand, "UrbanStride")
            XCTAssertEqual(firstShoe.price, 99.99)
            XCTAssertEqual(firstShoe.size, [38, 39, 40, 41, 42])
            XCTAssertEqual(firstShoe.model3DName, "leatherShoes")
        } catch {
            XCTFail("No se pudo cargar el archivo JSON: \(error.localizedDescription)")
        }
    }
}
