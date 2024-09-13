//
//  ShoeDataRepositoryTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import XCTest
@testable import SpatialShoes

final class ShoeDataRepositoryTests: XCTestCase {
    
    // MARK: - Pivate Properties
    
    private var repository: ShoeDataRepository!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = ShoeDataRepository()
    }
    
    override func tearDown() {
        repository = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testLoadShoesSuccess() {
        // Given
        let fileName = "ShoesTest"
        let bundle = Bundle(for: ShoeDataRepositoryTests.self)
        
        // When
        do {
            let shoes = try repository.loadShoes(fileName: fileName, bundle: bundle)
            
            // Then
            XCTAssertNotNil(shoes, "El método loadShoes debería devolver un array de zapatos.")
            XCTAssertFalse(shoes.isEmpty, "El array de zapatos debería contener al menos un zapato.")
            
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
