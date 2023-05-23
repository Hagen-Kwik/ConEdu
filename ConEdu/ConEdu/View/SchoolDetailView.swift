//
//  SchoolDetailView.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//

import SwiftUI
struct SchoolDetailView: View {
    @ObservedObject var schoolController: SchoolController
    @EnvironmentObject var wishlistController: WishlistController
    @State var schoolId: Int
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: toggleWishlist) {
                    if let school = schoolController.getSchoolByID(id: schoolId),
                       let wishlist = wishlistController.getWishlist(),
                       wishlist.contains(school) {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
                .padding()
                .foregroundColor(.red)
            }
            .padding(.horizontal)
            
            if let school = schoolController.getSchoolByID(id: schoolId) {
                VStack {
                    Text(school.school_name)
                        .font(.title)
                        .padding()
                    
                    Text("Email: \(school.gmail)")
                        .font(.headline)
                        .padding()
                    
                    Text("Scholarship Name: \(school.scholarship_name)")
                        .font(.headline)
                        .padding()
                    
                    Text("Scholarship Type: \(school.scholarship_type)")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                }
            } else {
                Text("School not found")
            }
        }
    }
    
    private func toggleWishlist() {
        if let school = schoolController.getSchoolByID(id: schoolId) {
            if wishlistController.getWishlist()?.contains(school) == true {
                wishlistController.deleteFromWishlist(school)
            } else {
                wishlistController.addToWishlist(school)
            }
        }
    }
    struct SchoolDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let dummySchoolController = SchoolController()
            let dummyWishlistController = WishlistController()
            
            return SchoolDetailView(schoolController: dummySchoolController, schoolId: 1).environmentObject(dummyWishlistController)
        }
    }
}
