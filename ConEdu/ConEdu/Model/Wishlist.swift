//
//  Wishlist.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//


import Foundation
class Wishlist: ObservableObject, Codable {
    var student_id: Int
    @Published var schools: [School] = []
    
    enum coding_keys: String, CodingKey {
        case student_id
        case schools
    }
    
    init(student_id: Int) {
        self.student_id = student_id
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: coding_keys.self)
        student_id = try container.decode(Int.self, forKey: .student_id)
        schools = try container.decode([School].self, forKey: .schools)
    }
    
    func contains(_ school: School) -> Bool {
        return schools.contains { $0.id == school.id }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: coding_keys.self)
        try container.encode(student_id, forKey: .student_id)
        try container.encode(schools, forKey: .schools)
    }
}

