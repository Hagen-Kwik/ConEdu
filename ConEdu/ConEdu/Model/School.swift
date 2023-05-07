//
//  School.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//

import Foundation

//school data class

struct School: Codable {
    var id:Int
    var school_name: String
    var gmail: String
    var scholarship_name: String
    var scholarship_description: String
    var scholarship_type: String
    var application_fee: Int
    var scholarship_degree: String
    var majors: [String: String]
    var required_documents: [String]
    
}
