//
//  SchoolDetailView.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//

import SwiftUI
struct SchoolDetailView: View {
    @ObservedObject var school_controller: SchoolController
    @EnvironmentObject var wishlist_controller: WishlistController
    @State var school_id: Int
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: toggleWishlist) {
                    if let school = school_controller.getSchoolByID(id: school_id),
                       let wishlist = wishlist_controller.getWishlist(),
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
            
            if let school = school_controller.getSchoolByID(id: school_id) {
                VStack {
                    //scholarship logo
                    Image(school.picture)
                        .resizable()
                        .frame(width: 95, height: 90)
                        .padding(1)
                    
                    //scholarship name
                    Text(school.scholarship_name)
                        .font(.title)
                        .bold()
                        .padding()
                    
                    //information details
                    VStack(alignment: .leading){
                        //school name
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "location.fill")
                            Text(school.school_name)
                        }.padding(5)
                        
                        //degree
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "medal")
                            Text(school.scholarship_degree)
                        }.padding(5)
                        
                        //scholarhsip type
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "dollarsign.circle")
                            Text(school.scholarship_type)
                        }.padding(5)
                    }
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .edgesIgnoringSafeArea(.all)

                    Text("Description")

                    Text("Application Fee: Rp. \(school.application_fee)")
                    
                    //apply scholarship button
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        Text("Apply Scholarship")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding(3)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(15) //
                    .padding(30)

                    
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                
                
            } else {
                Text("School not found")
            }
        }
    }
    
    private func toggleWishlist() {
        if let school = school_controller.getSchoolByID(id: school_id) {
            if wishlist_controller.getWishlist()?.contains(school) == true {
                wishlist_controller.deleteFromWishlist(school)
            } else {
                wishlist_controller.addToWishlist(school)
            }
        }
    }
    
    struct SchoolDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let dummySchoolController = SchoolController()
            let dummyWishlistController = WishlistController()
            
            return SchoolDetailView(school_controller: dummySchoolController, school_id: 1).environmentObject(dummyWishlistController)
        }
    }
}
