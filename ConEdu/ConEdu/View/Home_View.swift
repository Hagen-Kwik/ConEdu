//
//  Home_View.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//

import SwiftUI


struct Home_View: View {
    
//    @State private var searchText = ""

    var body: some View {
        
        VStack {
            
            //hello future awardees header, blue header
            VStack {
                HStack{
                    //change image later
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("Hello Future Awardee,")
                        //change name later
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
            
            ScrollView{

                //Recommended Scholarship START
                VStack{
                    HStack{
                        Text("Recommended Scholarships")
                        Spacer()
                        Text("See All")
                            .underline()
                    }
                }.padding()
                
                //recommended scholarship cardview
                HStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading){
                        //TITLE
                        Text("LPDP Austria Program")
                        //DESCRIPTION
                        Text("The scholarship program in Austria is designed to provide financial assistance to international students who wish to pursue higher education in the country.")
                        // icons
                        HStack{
                            //degree
                            Image(systemName: "medal")
                            Text("Bachelor")
                            //scholarhsip type
                            Text("$")
                            Text("Partially Funded")
                            //Date
                            Image(systemName: "calendar")
                            Text("Feb 24, 2024")
                        }
                    }
                    
                }
                .padding()
                .background(Color(red: 0.129, green: 0.588, blue: 0.952, opacity: 0.5))
                .roundedCorner(20, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                // Recommended Scholarship END

                //QUESTIONABLE BECAUSE ONLY 1 SCHOLARHSIP PER UNI
                //Based On University START
                VStack{
                    HStack{
                        Text("Based On University")
                        Spacer()
                        Text("See All")
                            .underline()
                    }
                }.padding()
                //Universities cardview
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    VStack{
                        Image("Logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        //TITLE
                        Text("Arizona State University")
                        //DESCRIPTION
                        Text("19 scholarships avialabe")
                        }.padding()
                        .background(Color(red: 0.129, green: 0.588, blue: 0.952, opacity: 0.5))
                        .roundedCorner(20, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                }
                //Based On University END
                
                
                //Based On Country START
                VStack{
                    HStack{
                        Text("Based On Country")
                        Spacer()
                        Text("See All")
                            .underline()
                    }
                }.padding()
                //countries cardview
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    VStack{
                        Image("Logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        //TITLE
                        Text("Arizona State University")
                        //DESCRIPTION
                        Text("19 scholarships avialabe")
                        }.padding()
                        .background(Color(red: 0.129, green: 0.588, blue: 0.952, opacity: 0.5))
                        .roundedCorner(20, corners: [.bottomLeft, .bottomRight, .topRight, .topLeft])
                }
                //Based On Country END

                
                
            }.padding()
        }.ignoresSafeArea()
    }
}

struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View()
    }
}


