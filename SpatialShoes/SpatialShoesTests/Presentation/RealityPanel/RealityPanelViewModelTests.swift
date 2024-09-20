//
//  RealityPanelViewModelTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import XCTest
@testable import SpatialShoes

final class RealityPanelViewModelTests: XCTestCase {

    // MARK: - Pivate Properties
    
    private var sut: RealityPanelViewModel!
    private var useCase: FavoriteShoesUseCase!
    private var repository: FavoriteShoesRepository!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = FavoriteShoesRepository()
        useCase = FavoriteShoesUseCase(repository: repository)
        sut = RealityPanelViewModel(favoriteShoesUseCase: useCase)
    }
    
    override func tearDown() {
        sut = nil
        useCase = nil
        repository = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testToggleFavoriteWithSuccess() {
        // Given
        let shoe = Shoe(id: 0,
                        name: "Authentic",
                        brand: "Vans",
                        size: [45],
                        price: 60.0,
                        description: "Classics!",
                        model3DName: "VansAuthentic",
                        type: "Casual",
                        materials: ["Casual"],
                        origin: "USA",
                        gender: "Unisex",
                        weight: 1.2,
                        colors: ["Black", "White", "Red", "Blue"],
                        warranty: 1,
                        certifications: ["Handmade", "Eco"])
        
        // When
        sut.toggleFavorite(shoe)
        
        // Then
        XCTAssertFalse(sut.favoriteShoes.isEmpty)
        XCTAssertEqual(sut.favoriteShoes.count, 1)
    }
}
