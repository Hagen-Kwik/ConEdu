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
    var wishlist_id: Int
    
    // initalizing the coding keys to provide coding keys for encoding and decoding.
    enum coding_keys: String, CodingKey {
        case student_id
        case schools
        case wishlist_id
    }
    
    //initializer of the wishlist class
    init(student_id: Int, wishlist_id: Int) {
        self.student_id = student_id
        self.wishlist_id = wishlist_id
    }
    
    // decode function is used to decote data to wishlist model
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: coding_keys.self)
        
        // Decoding from the decoder using the coding keys
        student_id = try container.decode(Int.self, forKey: .student_id)
        
        schools = try container.decode([School].self, forKey: .schools)
        
        wishlist_id = try container.decode(Int.self, forKey: .wishlist_id)
    }
    
    func contains(_ school: School) -> Bool {
        return schools.contains { $0.id == school.id }
    }
    
    // encode the wishlist data and store it
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: coding_keys.self)
        
        // Encoding  to the encoder using the coding keys
        try container.encode(student_id, forKey: .student_id)
        
        try container.encode(schools, forKey: .schools)
        
        try container.encode(wishlist_id, forKey: .wishlist_id)
    }
}

