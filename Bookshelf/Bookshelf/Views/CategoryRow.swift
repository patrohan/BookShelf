//
//  CategoryRow.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import SwiftUI
//Individual row structure for Categorylist
struct CategoryRow: View {
    //var bookshelf: Bookshelf
    var category : CategoryShelf
    
    var body: some View {
        HStack{
            Text(category.name)
            
            Spacer()
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                CategoryRow(category: categories[0])
                CategoryRow(category: categories[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
