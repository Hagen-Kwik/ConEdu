//
//  ContentView.swift
//  ConEdu
//
//  Created by MacBook Pro on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            Home_View()
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }
            
            Application_View()
                .tabItem {
                    Label("Application", systemImage: "folder")
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
