//
//  Custom_Rounded_Rectangle.swift
//  ConEdu
//
//  Created by MacBook Pro on 07/05/23.
//

import SwiftUI

struct Custom_Rounded_Rectangle: Shape {
    
    //creates a rectangular shape with 2 rounded bottom corners
        
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners
           
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(Custom_Rounded_Rectangle(radius: radius, corners: corners) )
    }
}
