//
//  WishlistController.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//






import Foundation

class WishlistController: ObservableObject {
    @Published var wishlists: [Wishlist] = []
    var student_id: Int = 0 // The current student ID
        

        
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
        
        func getWishlist(_ school: School, students_id: Int) -> Wishlist? {
            return wishlists.first { $0.student_id == student_id }
        }
        
    func addToWishlist(_ school: School, students_id: Int) {
        if let wishlist = getWishlist(school, students_id: student_id) {
            let newWishlist = Wishlist(student_id: student_id)

                      for existingSchool in wishlist.schools {
                          newWishlist.schools.append(existingSchool)
                      }

            newWishlist.schools.append(school)

                if let index = wishlists.firstIndex(where: { $0.student_id == student_id }) {
                          wishlists.remove(at: index)
                      }
                      wishlists.append(newWishlist)
                  } else {
                      let newWishlist = Wishlist(student_id: student_id)
                      newWishlist.schools.append(school)
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
        
        func deleteFromWishlist(_ school: School, students_id: Int) {
            for wishlist in wishlists {
                if wishlist.student_id == student_id {
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

}
