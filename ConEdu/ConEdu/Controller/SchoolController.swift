//
//  SchoolController.swift
//  ConEdu
//
//  Created by MacBook Pro on 21/05/23.
//

import Foundation

class SchoolController: ObservableObject {
    @Published var schools: [School] = School.data
    
    func getSchoolList() -> Array<School> {
       return schools
    }
    
    func getSchoolByID(id: Int) -> School? {
          return schools.first { $0.id == id }
      }

}
