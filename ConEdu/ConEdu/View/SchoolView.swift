//
//  Home_View.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//

import SwiftUI


struct SchoolView: View {
    
    @ObservedObject var school_controller : SchoolController
    @EnvironmentObject var wishlist_controller: WishlistController
    
    var body: some View {
        NavigationView {
        VStack {
            
            //hello future awardees header, blue header
            VStack {
                HStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("Hello Future Awardee,")
                        //name
                        Text("John Doe")
                            .font(.largeTitle)
                    }
                    
                }.padding(.top,50)
            }
            .padding()
            .background(Color.orange)
            .roundedCorner(20, corners: [.bottomLeft, .bottomRight])
            .ignoresSafeArea()
            //header end
            
            //main view for scholarship cards
         
                ScrollView{
                //Recommended Scholarship START
                    Text("Scholarships Available")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    
                    
                        //scholarship cardview
                        ForEach(school_controller.getSchoolList()) { school in
                            //navigation to details
                            NavigationLink(destination: SchoolDetailView(school_controller: school_controller, school_id: school.id).environmentObject(wishlist_controller)) {
                                HStack {
                                    //scholarship logo
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
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    // end navview bracket
    }
}

//struct Home_View_Previews: PreviewProvider {
//    static var previews: some View {
//        let dummySchoolController = SchoolController()
//        let dummyWishlistController = WishlistController()
//        SchoolView(school_controller: dummySchoolController).environmentObject(dummyWishlistController)
//    }
//}

