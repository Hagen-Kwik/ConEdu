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
    @State private var showMessage = false
    @State private var toastMessage = ""


    
    var body: some View {
        VStack {
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
                    ScrollView(){
                        VStack(alignment: .leading) {
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
                            
                            //description
                            Text("Description")
                                .font(.headline)
                                .padding(5)
                            Text(school.scholarship_description)
                                .padding([.leading, .trailing], 5)

                            
                            // Majors
                            Text("Majors")
                                .font(.headline)
                                .padding(5)
                            ForEach(Array(school.majors), id: \.key) { major, description in
                                Text("\(major) : \(description)")
                                    .font(.subheadline)
                                    .padding([.leading, .trailing], 5)
                            }
                            
                            //required documents
                            Text("Required Documents")
                                .font(.headline)
                                .padding(5)
                            ForEach(school.required_documents, id: \.self) { document in
                                Text("- \(document)")
                                    .font(.subheadline)
                                    .padding([.leading, .trailing], 5)
                            }

                            //aplication fee
                            Text("Application Fee: Rp. \(school.application_fee)")
                                .font(.headline)
                                .padding(5)

                            
                        }
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                    Spacer()

                    
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
           
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //wishlist button
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: toggleWishlist) {
                            if let wishlist = wishlist_controller.getWishlist(school, students_id: school_id), wishlist.contains(school) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                            } else {
                                Image(systemName: "heart")
                            }
                        }
                    }
                }
            } else {
                Text("School not found")
            }
        }
    }
    
    private func toggleWishlist(){
        if let school = school_controller.getSchoolByID(id: school_id) {
            if wishlist_controller.getWishlist(school, students_id: school_id)?.contains(school) == true {
                //remove from wishlist
                wishlist_controller.deleteFromWishlist(school, students_id: school_id)
                toastMessage = "School removed from wishlist"
            } else {
//               add to wishlist
                wishlist_controller.addToWishlist(school, students_id: school_id)
                toastMessage = "School added to wishlist"
            }
        }
        showMessage = true

    }
    
    struct SchoolDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let dummySchoolController = SchoolController()
            let dummyWishlistController = WishlistController()
            
            return SchoolDetailView(school_controller: dummySchoolController, school_id: 1).environmentObject(dummyWishlistController)
        }
    }
}
