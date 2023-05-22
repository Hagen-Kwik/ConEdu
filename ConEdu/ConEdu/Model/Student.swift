//
//  Student.swift
//  ConEdu
//
//  Created by MacBook Pro on 20/05/23.
//

import Foundation

class Student: ObservableObject {
            
    @Published var student_id: String{
        didSet{
            UserDefaults.standard.set(student_id, forKey:"student_id")
        }
    }
    
    @Published var email: String{
        didSet{
            UserDefaults.standard.set(email, forKey:"email")
        }
    }
    
    @Published var password: String{
        didSet{
            UserDefaults.standard.set(password, forKey:"password")
        }
    }
    
    @Published var full_name: String{
        didSet{
            UserDefaults.standard.set(full_name, forKey:"full_name")
        }
    }
    
    @Published var age: String{
        didSet{
            UserDefaults.standard.set(age, forKey:"age")
        }
    }
    
    @Published var domicile: String{
        didSet{
            UserDefaults.standard.set(domicile, forKey:"domicile")
        }
    }
    
    //    var wishlist:

    
    init() {
        self.student_id = UserDefaults.standard.object(forKey: "student_id") as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? ""
        self.password = UserDefaults.standard.object(forKey: "password") as? String ?? ""
        self.full_name = UserDefaults.standard.object(forKey: "full_name") as? String ?? ""
        self.age = UserDefaults.standard.object(forKey: "age") as? String ?? ""
        self.domicile = UserDefaults.standard.object(forKey: "domicile") as? String ?? ""

    }
}
