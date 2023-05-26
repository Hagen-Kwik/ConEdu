//
//  Student.swift
//  ConEdu
//
//  Created by MacBook Pro on 20/05/23.
//

import Foundation

struct Student {
            
    var student_id: Int
    var email: String
    var password: String
    var full_name: String
    var age: String
    var domicile: String
    var wishlist: Wishlist
    
    func getStudentID() -> Int {
        return student_id
    }

}

