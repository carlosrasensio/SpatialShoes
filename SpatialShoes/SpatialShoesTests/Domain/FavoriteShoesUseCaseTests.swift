//
//  FavoriteShoesUseCaseTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import XCTest
@testable import SpatialShoes

final class FavoriteShoesUseCaseTests: XCTestCase {

    // MARK: - Pivate Properties
    
    private var sut: FavoriteShoesUseCase!
    private var repository: FavoriteShoesRepository!
    
    private let shoe = Shoe(id: 0,
                            name: "Authentic",
                            brand: "Vans",
                            size: [44, 45],
                            price: 60.0,
                            descriptionString: "Classics!",
                            model3DName: "VansAuthentic",
                            type: "Casual",
                            materials: ["Casual"],
                            origin: "USA",
                            gender: "Unisex",
                            weight: 1.2,
                            colors: ["Black", "White", "Red", "Blue"],
                            warranty: 1,
                            certifications: ["Handmade", "Eco"])
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = FavoriteShoesRepository()
        sut = FavoriteShoesUseCase(repository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testExecuteSaveActionWithSuccess() {
        do {
            // When
            try sut.execute(action: .save, for: shoe)
        } catch {
            XCTFail("❌ Error al ejecutar el caso de uso")
        }
        
        // Then
        XCTAssertFalse(sut.favoriteShoes.isEmpty)
        XCTAssertEqual(sut.favoriteShoes.count, 1)
    }
    
    func testExecuteDeleteActionWithSuccess() {
        do {
            // When
            try sut.execute(action: .save, for: shoe)
            try sut.execute(action: .delete, for: shoe)
        } catch {
            XCTFail("❌ Error al ejecutar el caso de uso")
        }
        
        // Then
        XCTAssertTrue(sut.favoriteShoes.isEmpty)
    }
    
    func testExecuteSaveActionWithFailure() {
        do {
            // When
            try sut.execute(action: .save, for: shoe)
        } catch {
            XCTFail("❌ Error al ejecutar el caso de uso")
        }
        
        // Then
        XCTAssertFalse(sut.favoriteShoes.isEmpty)
        XCTAssertEqual(sut.favoriteShoes.count, 1)
    }
    
    func testExecuteDeleteActionWithFailure() {
        do {
            // When
            try sut.execute(action: .save, for: shoe)
            try sut.execute(action: .delete, for: shoe)
        } catch {
            XCTFail("❌ Error al ejecutar el caso de uso")
        }
        
        // Then
        XCTAssertTrue(sut.favoriteShoes.isEmpty)
    }
}
