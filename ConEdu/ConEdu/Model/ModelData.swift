//
//  ModelData.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//
//

import Foundation
import Combine

// model data, saving data so it can change with user input too
final class ModelData: ObservableObject {
    @Published var Schools: [School] = load("DummyData.json")
//    var hikes: [Hike] = load("hikeData.json")

//    var features: [Landmark] {
//        landmarks.filter { $0.isFeatured }
//    }
//
//    var categories: [String: [Landmark]] {
//        Dictionary(
//            grouping: landmarks,
//            by: { $0.category.rawValue }
//        )
//    }
//
//    @Published var profile = Profile.default
    

}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
