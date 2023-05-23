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
    
    func getWishlist() -> Wishlist? {
        return wishlists.first { $0.studentId == studentId }
    }
    
    // still with bug
//    func addToWishlist(_ school: School) {
//        if let wishlist = getWishlist() {
//            if !wishlist.contains(school) {
//                wishlist.addToWishlist(school)
//            }
//        } else {
//            let newWishlist = Wishlist(studentId: studentId)
//            newWishlist.addToWishlist(school)
//            wishlists.append(newWishlist)
//        }
//    }
    
    // bug fix alternative 1
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
    }
    
   
    
    func deleteFromWishlist(_ school: School) {
        for wishlist in wishlists {
            if wishlist.studentId == studentId {
                wishlist.schools.removeAll { $0.id == school.id }
            }
        }
        wishlists.removeAll { $0.schools.isEmpty }
    }
}
