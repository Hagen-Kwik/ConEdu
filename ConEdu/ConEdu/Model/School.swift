//
//  School.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//

import Foundation

//school data class
struct School: Codable, Identifiable {
    var id: Int
    var school_name: String
    var gmail: String
    var scholarship_name: String
    var scholarship_description: String
    var scholarship_type: String
    var application_fee: Int
    var scholarship_degree: String
    var majors: [String: String]
    var required_documents: [String]
    var picture: String
    
    

    init(id: Int , school_name: String, gmail: String, scholarship_name: String, scholarship_description: String, scholarship_type: String, application_fee: Int, scholarship_degree: String, majors: [String: String],  required_documents: [String], picture: String) {
        self.id = id
        self.school_name = school_name
        self.gmail = gmail
        self.scholarship_name = scholarship_name
        self.scholarship_description = scholarship_description
        self.scholarship_type = scholarship_type
        self.application_fee = application_fee
        self.scholarship_degree = scholarship_degree
        self.majors = majors
        self.required_documents = required_documents
        self.picture = picture
    }
}


extension School{
    static let data: [School] = [
        School(id: 1,
                school_name: "Harvard University",
                gmail: "harvard@gmail.com",
                scholarship_name: "Empower Scholarship",
                scholarship_description: "This scholarship program aims to empower students by providing financial assistance to pursue their studies at Harvard University.",
                scholarship_type: "fully funded",
                application_fee: 250000,
                scholarship_degree: "Undergraduate",
                majors: ["Computer Science": "Explore the world of algorithms, data structures, and software development."],
                required_documents: ["Transcripts", "Letters of Recommendation"],
                picture: "harvard"),
                
        School(id: 2,
                school_name: "Stanford University",
                gmail: "stanford@gmail.com",
                scholarship_name: "Merit Scholarship",
                scholarship_description: "The Merit Scholarship at Stanford University recognizes outstanding academic achievements and provides partial funding for students across various disciplines.",
                scholarship_type: "partially funded",
                application_fee: 300000,
                scholarship_degree: "Graduate",
                majors: ["Business Administration": "Develop leadership and management skills for a successful business career."],
                required_documents: ["Statement of Purpose", "CV/Resume"],
                picture: "stanford"),
                
        School(id: 3,
                school_name: "Massachusetts Institute of Technology",
                gmail: "mit@gmail.com",
                scholarship_name: "STEM Scholarship",
                scholarship_description: "The STEM Scholarship at MIT supports students pursuing degrees in science, technology, engineering, and mathematics.",
                scholarship_type: "2000",
                application_fee: 180000,
                scholarship_degree: "Undergraduate",
                majors: ["Physics": "Study the fundamental laws of nature and explore the mysteries of the universe."],
                required_documents: ["Standardized Test Scores", "Essay"],
                picture: "mit"),
        
        School(id: 4,
                school_name: "University of Oxford",
                gmail: "oxford@gmail.com",
                scholarship_name: "Global Leaders Scholarship",
                scholarship_description: "The Global Leaders Scholarship at the University of Oxford is designed for exceptional students who demonstrate leadership potential and a commitment to making a positive impact on the world.",
                scholarship_type: "partially funded",
                application_fee: 280000,
                scholarship_degree: "Undergraduate",
                majors: ["International Relations": "Explore the complexities of global politics and diplomacy."],
                required_documents: ["Personal Statement", "Academic References"],
                picture: "oxford"),
        
        School(id: 5,
                school_name: "Columbia University",
                gmail: "columbia@gmail.com",
                scholarship_name: "Diversity Scholarship",
                scholarship_description: "The Diversity Scholarship at Columbia University promotes diversity and inclusivity by providing financial support to students from underrepresented backgrounds.",
                scholarship_type: "fully funded",
                application_fee: 220000,
                scholarship_degree: "Graduate",
                majors: ["Social Work": "Make a difference in the lives of individuals and communities through social justice advocacy."],
                required_documents: ["Resume/CV", "Portfolio"],
                picture: "columbia"),
                
        School(id: 6,
               school_name: "Yale University",
                gmail: "yale@gmail.com",
               scholarship_name: "Future Innovators Scholarship",
                scholarship_description: "The Future Innovators Scholarship at Yale University supports students with a passion for innovation and creativity to pursue their academic and entrepreneurial endeavors.",
                scholarship_type: "partially funded",
                application_fee: 260000,
                scholarship_degree: "Undergraduate",
                majors: ["Biomedical Engineering": "Merge engineering principles with medical sciences to improve healthcare technologies."],
                required_documents: ["Research Proposal", "Academic Transcripts"],
                picture: "yale"),
                
        School(id: 7,
                school_name: "Princeton University",
                gmail: "princeton@gmail.com",
                scholarship_name: "Excellence in Arts Scholarship",
                scholarship_description: "The Excellence in Arts Scholarship at Princeton University recognizes talented artists across various disciplines and provides support for their creative pursuits.",
                scholarship_type: "fully funded",
                application_fee: 230000,
                scholarship_degree: "Graduate",
                majors: ["Fine Arts": "Express your creativity and explore diverse forms of artistic expression."],
                required_documents: ["Portfolio", "Artist Statement"],
                picture: "princeton"),
        
        School(id: 8,
                school_name: "University of Cambridge",
                gmail: "cambridge@gmail.com",
                scholarship_name: "Innovation and Entrepreneurship Scholarship",
                scholarship_description: "The Innovation and Entrepreneurship Scholarship at the University of Cambridge nurtures aspiring entrepreneurs by providing financial assistance and mentorship to develop their innovative ideas into successful ventures.",
                scholarship_type: "partially funded",
                application_fee: 270000,
                scholarship_degree: "Undergraduate",
                majors: ["Business and Management": "Learn the principles of effective business management and strategic decision-making."],
                required_documents: ["Business Plan", "Entrepreneurial Experience"],
                picture: "cambridge"),
                
        School(id: 9,
                school_name: "University of Chicago",
                gmail: "uchicago@gmail.com",
                scholarship_name: "Research Excellence Scholarship",
                scholarship_description: "The Research Excellence Scholarship at the University of Chicago supports students who demonstrate exceptional research potential across various academic disciplines.",
                scholarship_type: "5000",
                application_fee: 200000,
                scholarship_degree: "Graduate",
                majors: ["Economics": "Analyze economic systems and their impact on society."],
                required_documents: ["Research Proposal", "Letters of Recommendation"],
                picture: "chicago"),
                
        School(id: 10,
                school_name: "University of California, Berkeley",
                gmail: "berkeley@gmail.com",
                scholarship_name: "Social Impact Scholarship",
                scholarship_description: "The Social Impact Scholarship at the University of California, Berkeley, empowers students to make a positive difference in society by providing financial support for their impactful projects and initiatives.",
                scholarship_type: "partially funded",
                application_fee: 240000,
                scholarship_degree: "Undergraduate",
                majors: ["Environmental Science": "Address environmental challenges and work towards a sustainable future."],
                required_documents: ["Statement of Impact", "Community Service Record"],
                picture: "berkeley")
    ]

}
