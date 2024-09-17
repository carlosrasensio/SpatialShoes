//
//  JSONManager.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class JSONManager {
    
    // MARK: - Public Properties
    
    static let shared = JSONManager()
    
    // MARK: - Public Functions

    func load<T: Decodable>(fileName: String,
                            type: T.Type,
                            bundle: Bundle = Bundle(for: JSONManager.self)) throws -> T? {
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            print("❌ JSON file not sound: \(fileName)")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("❌ Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
