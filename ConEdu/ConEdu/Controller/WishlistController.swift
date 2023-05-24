//
//  WishlistController.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//

import Foundation

class WishlistController: ObservableObject {
    @Published var wishlists: [Wishlist] = []
    var studentId: Int = 0 // The current student ID
        
        // UserDefaults keys
//        private let wishlistKey = "WishlistKey"
        
        init() {
            guard let data = UserDefaults.standard.data(forKey: "WishlistKey") else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let wishlists = try decoder.decode([Wishlist].self, from: data)
                self.wishlists = wishlists
            } catch {
                print("Failed to load wishlists: \(error)")
            }
        }
        
        func getWishlist() -> Wishlist? {
            return wishlists.first { $0.studentId == studentId }
        }
        
        func addToWishlist(_ school: School) {
            if let wishlist = getWishlist() {
                      let newWishlist = Wishlist(studentId: studentId)

                      for existingSchool in wishlist.schools {
                          newWishlist.addToWishlist(existingSchool)
                      }

                      newWishlist.addToWishlist(school)

                      if let index = wishlists.firstIndex(where: { $0.studentId == studentId }) {
                          wishlists.remove(at: index)
                      }
                      wishlists.append(newWishlist)
                  } else {
                      let newWishlist = Wishlist(studentId: studentId)
                      newWishlist.addToWishlist(school)
                      wishlists.append(newWishlist)
                  }
            
//            saveWishlists()
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(wishlists)
                UserDefaults.standard.set(data, forKey: "WishlistKey")
            } catch {
                print("Failed to save wishlists: \(error)")
            }
        }
        
        func deleteFromWishlist(_ school: School) {
            for wishlist in wishlists {
                if wishlist.studentId == studentId {
                    wishlist.schools.removeAll { $0.id == school.id }
                }
            }
            
            wishlists.removeAll { $0.schools.isEmpty }
            
//            saveWishlists()
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(wishlists)
                UserDefaults.standard.set(data, forKey: "WishlistKey")
            } catch {
                print("Failed to save wishlists: \(error)")
            }
        }
        
//        // Save wishlists to UserDefaults
//        private func saveWishlists() {
//            do {
//                let encoder = JSONEncoder()
//                let data = try encoder.encode(wishlists)
//                UserDefaults.standard.set(data, forKey: wishlistKey)
//            } catch {
//                print("Failed to save wishlists: \(error)")
//            }
//        }
//
//        // Load wishlists from UserDefaults
//        private func loadWishlists() {
//            guard let data = UserDefaults.standard.data(forKey: wishlistKey) else {
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let wishlists = try decoder.decode([Wishlist].self, from: data)
//                self.wishlists = wishlists
//            } catch {
//                print("Failed to load wishlists: \(error)")
//            }
//        }

}
