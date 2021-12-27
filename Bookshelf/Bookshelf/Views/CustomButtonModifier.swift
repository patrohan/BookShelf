//
//  CustomButtonModifier.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/1/21.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        return content
            .foregroundColor(.white)
            .padding(.vertical)
            .padding(.horizontal,35)
            .background(
                LinearGradient(gradient: .init(colors: [Color("blue"),Color("blue")]), startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(Capsule())
    }
}
