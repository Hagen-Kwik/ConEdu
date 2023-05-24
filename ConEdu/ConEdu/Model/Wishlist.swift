//
//  Wishlist.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//

import Foundation
class Wishlist: ObservableObject, Codable {
    var studentId: Int
    @Published var schools: [School] = []
    
    enum CodingKeys: String, CodingKey {
        case studentId
        case schools
    }
    
    init(studentId: Int) {
        self.studentId = studentId
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        studentId = try container.decode(Int.self, forKey: .studentId)
        schools = try container.decode([School].self, forKey: .schools)
    }
    
    func contains(_ school: School) -> Bool {
        return schools.contains { $0.id == school.id }
    }
    
    func addToWishlist(_ school: School) {
        if !contains(school) {
            schools.append(school)
        }
    }
    
    func deleteFromWishlist(_ school: School) {
        schools.removeAll { $0.id == school.id }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(studentId, forKey: .studentId)
        try container.encode(schools, forKey: .schools)
    }
}

