//
//  ContentView.swift
//  ConEdu
//
//  Created by MacBook Pro on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var student = Student()

    
    var body: some View {
        TabView {
            SchoolView()
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }

            Application_View()
                .tabItem {
                    Label("Wishlist", systemImage: "star.fill")
                }

            Profile_View()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

        
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
