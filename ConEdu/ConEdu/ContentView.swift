//
//  ContentView.swift
//  ConEdu
//
//  Created by MacBook Pro on 04/05/23.
//

import SwiftUI

struct ContentView: View {
     var schoolController = SchoolController()
    var wishlistController = WishlistController()

    var body: some View {
        TabView {
            SchoolView(school_controller: schoolController)
                .environmentObject(wishlistController)
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }

            WishlistView(schoolController: schoolController)
                .environmentObject(wishlistController)
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
