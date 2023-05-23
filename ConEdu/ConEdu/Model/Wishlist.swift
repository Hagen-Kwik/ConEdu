//
//  Wishlist.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//

import Foundation
class Wishlist: ObservableObject {
    var studentId: Int 
    @Published var schools: [School] = []
    
    init(studentId: Int) {
        self.studentId = studentId
    }
    
    func contains(_ school: School) -> Bool {
        return schools.contains { $0.id == school.id && $0.school_name == school.school_name } // Modify the condition to check for equality
    }
    
    
    func addToWishlist(_ school: School) {
        if !contains(school) {
            schools.append(school)
        }
    }
    
    func deleteFromWishlist(_ school: School) {
        schools.removeAll { $0.id == school.id }
    }
}
