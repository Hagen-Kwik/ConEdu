//
//  WishlistController.swift
//  ConEdu
//
//  Created by Vincent on 22/05/23.
//






import Foundation

// WishlistController manages the wishlists
class WishlistController: ObservableObject {
    // Published property for wishlists
    @Published var wishlists: [Wishlist] = []
    
    // The current student ID
    var student_id: Int = 0
    
    // Initialize wishlists from UserDefaults on app launch
    init() {
        // Retrieve data from UserDefaults
        guard let data = UserDefaults.standard.data(forKey: "WishlistKey") else {
            return
        }
        
        do {
            // Decode the data into array of wishlists
            let decoder = JSONDecoder()
            let wishlists = try decoder.decode([Wishlist].self, from: data)
            self.wishlists = wishlists
        } catch {
            print("Failed to load wishlists: \(error)")
        }
    }
    
    // Get the wishlist for a specific student and school
    func getWishlist(_ school: School, students_id: Int) -> Wishlist? {
        return wishlists.first { $0.student_id == student_id }
    }
    
    // Add a school to the wishlist
    func addToWishlist(_ school: School, students_id: Int) {
        if let wishlist = getWishlist(school, students_id: student_id) {
            let newWishlist = Wishlist(student_id: student_id)
            
            // Copy existing schools to the new wishlist
            for existingSchool in wishlist.schools {
                newWishlist.schools.append(existingSchool)
            }
            
            newWishlist.schools.append(school)
            
            // Replace the existing wishlist with the new one
            if let index = wishlists.firstIndex(where: { $0.student_id == student_id }) {
                wishlists.remove(at: index)
            }
            wishlists.append(newWishlist)
        } else {
            // Create a new wishlist with the school
            let newWishlist = Wishlist(student_id: student_id)
            newWishlist.schools.append(school)
            wishlists.append(newWishlist)
        }
        
        // Save wishlists to UserDefaults
        do {
            // Create an instance of JSONEncoder
            let encoder = JSONEncoder()
            
            // Encode the wishlists into data
            let data = try encoder.encode(wishlists)
            
            // Store the encoded data in UserDefaults with a specified key
            UserDefaults.standard.set(data, forKey: "WishlistKey")
        } catch {
            // Handle the error if encoding and saving fails
            print("Failed to save wishlists: \(error)")
        }
    }
        // Remove a school from the wishlist
        func deleteWishlist(_ school: School, students_id: Int) {
            for wishlist in wishlists {
                if wishlist.student_id == student_id {
                    wishlist.schools.removeAll { $0.id == school.id }
                }
            }
            
            // Remove wishlists with no schools
            wishlists.removeAll { $0.schools.isEmpty }
            
            // Save wishlists to UserDefaults
            do {
                // Create an instance of JSONEncoder
                let encoder = JSONEncoder()
                
                // Encode the wishlists into data
                let data = try encoder.encode(wishlists)
                
                // Store the encoded data in UserDefaults with a specified key
                UserDefaults.standard.set(data, forKey: "WishlistKey")
            } catch {
                // Handle the error if encoding and saving fails
                print("Failed to save wishlists: \(error)")
            }
        }
    }

