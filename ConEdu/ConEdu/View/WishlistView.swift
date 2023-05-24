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
    var body: some View {
        NavigationView {
            VStack {
                
                // wishlist title
                Text("Scholarship Wishlist")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                
                ScrollView{
                    //scholarship cardview
                    ForEach(wishlist_controller.getWishlist()?.schools ?? []) { school in
                        //nagivation
                        NavigationLink(destination: SchoolDetailView(school_controller: school_controller, school_id: school.id).environmentObject(wishlist_controller)) {
                            HStack {
                                Image(school.picture)
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                    .padding(1)
                                
                                VStack(alignment: .leading){
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
                                    HStack{
                                        //degree
                                        Image(systemName: "medal")
                                        Text(school.scholarship_degree)
                                            .font(.caption)
                                        
                                        //scholarhsip type
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
                            // end navlink bracket
                        }
                        // end loop bracket
                    }
                    
                }.padding()
            }
        }
    // end navview bracket
    }
}


