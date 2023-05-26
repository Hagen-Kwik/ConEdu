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
    @State private var show_message = false
    @State private var toast_message = ""


    
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
                // show toast in overlay
                .overlay(
                    Group {
                        if show_message {
                            ToastView(show_message: $show_message, toast_message: toast_message)
                                .transition(.opacity)
                        }
                    }
                )
                
                
            } else {
                Text("School not found")
            }
        }
    }
    
    private func toggleWishlist(){
        if let school = school_controller.getSchoolByID(id: school_id) {
            if wishlist_controller.getWishlist(school, students_id: school_id)?.contains(school) == true {
                //remove from wishlist & assign toast message
                wishlist_controller.deleteFromWishlist(school, students_id: school_id)
                toast_message = "School removed from wishlist"
            } else {
//               add to wishlist & assign toast message
                wishlist_controller.addToWishlist(school, students_id: school_id)
                toast_message = "School added to wishlist"
            }
        }
        //change show message true to show toast view
        show_message = true
    }
    
    
    struct ToastView: View {
        
        @Binding var show_message: Bool
        var toast_message: String
        
        var body: some View {
            VStack {
                //text on colored box background
                Text(toast_message)
                    .font(.headline)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
            //1 second after appearing change show_message back to false to make view disappear
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        show_message = false
                    }
                }
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
