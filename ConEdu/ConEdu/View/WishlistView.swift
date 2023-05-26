//
//  Home_View.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//
import SwiftUI

struct WishlistView: View {
    
    @ObservedObject var school_controller: SchoolController
    @EnvironmentObject var wishlist_controller: WishlistController

    @State var id: Int?

    var body: some View {
        
        NavigationView {
            VStack {
                // wishlist title
                Text("Scholarship Wishlist")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                ScrollView {
                    //if wishlist is empty
                    if wishlist_controller.getWishlist(school_controller.schools[0], students_id: 0)?.schools.isEmpty ?? true {
                        Text("No Scholarships on Wishlist")
                            .font(.headline)
                            .padding()
                        
                    // if wishilst not empty
                    } else {
                        //scholarship card view inside foreach of school
                        ForEach(wishlist_controller.getWishlist(school_controller.schools[0], students_id: 0)?.schools ?? []) { school in
                            Button(action: {
                                //give school id to id so that view doesnt dissapear later on from wishlist view
                                id = school.id
                            }) {
                                HStack {
                                    //picture
                                    Image(school.picture)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .padding(1)

                                    VStack(alignment: .leading) {
                                        //TITLE
                                        Text(school.scholarship_name)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        //DESCRIPTION
                                        Text(school.scholarship_description)
                                            .lineLimit(2)
                                            .truncationMode(.tail)
                                            .font(.caption)

                                        // icons
                                        HStack {
                                            //degree
                                            Image(systemName: "medal")
                                            Text(school.scholarship_degree)
                                                .font(.caption)

                                            //scholarship type
                                            Text("$")
                                            Text(school.scholarship_type)
                                                .font(.caption)
                                        }
                                        .padding(1)

                                    }

                                }
                                .padding()
                                .background(Color(red: 0.129, green: 0.588, blue: 0.952, opacity: 0.5))
                                .roundedCorner(20, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                            }
                            // Remove button style
                            .buttonStyle(PlainButtonStyle())
                        }
                        

                    }
                }
            }
            .padding()
            //navigation link is put outside the stackview so that even when wishlist is empty, id and navigationlink is still present so that view can remain in detailsview
            .background(
                NavigationLink(destination: SchoolDetailView(school_controller: school_controller, school_id: id ?? 0).environmentObject(wishlist_controller), isActive: Binding<Bool>(
                    // make sure id is not nil before navigating to next view
                        get: { id != nil },
                        set: { _ in id = nil }
                    ),
                    label: { EmptyView() }
                    )
                // Hide the NavigationLink
                .opacity(0)
            )
        }
    }
}

