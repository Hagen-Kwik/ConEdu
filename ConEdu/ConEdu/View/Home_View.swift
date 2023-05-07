//
//  Home_View.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//

import SwiftUI


struct Home_View: View {
    
    @State private var searchText = ""

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
            
            ScrollView{}
        }
    }
}

struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View()
    }
}
